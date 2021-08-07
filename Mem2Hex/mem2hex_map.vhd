--------------------------------------------------------
-- mcc V1.0.0807 - Custom microcode compiler (c)2020-... 
--    https://github.com/zpekic/MicroCodeCompiler
--------------------------------------------------------
-- Auto-generated file, do not modify. To customize, create 'mapper_template.vhd' file in mcc.exe folder
-- Supported placeholders:  [SIZES], [NAME], [TYPE], [INSTANCE], [SIGNAL], [MEMORY].
--------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
--use IEEE.numeric_std.all;

package mem2hex_map is

-- memory block size
constant MAPPER_DATA_WIDTH: 	positive := 6;
constant MAPPER_ADDRESS_WIDTH: 	positive := 8;
constant MAPPER_ADDRESS_LAST: 	positive := 255;


type m2h_mapper_memory is array(0 to 255) of std_logic_vector(5 downto 0);

signal m2h_instructionstart: std_logic_vector(5 downto 0);

--m2h_instructionstart <= m2h_mapper(to_integer(unsigned(TODO))); -- copy to file containing the control unit. TODO is typically the 'instruction_register'



constant m2h_mapper: m2h_mapper_memory := (

-- L0118@0009. .map 0b00000000
0 => O"11",

1 => O"05",

2 => O"05",

3 => O"05",

4 => O"05",

5 => O"05",

6 => O"05",

7 => O"05",

8 => O"05",

9 => O"05",

10 => O"05",

11 => O"05",

12 => O"05",

13 => O"05",

14 => O"05",

15 => O"05",

16 => O"05",

17 => O"05",

18 => O"05",

19 => O"05",

20 => O"05",

21 => O"05",

22 => O"05",

23 => O"05",

24 => O"05",

25 => O"05",

26 => O"05",

27 => O"05",

28 => O"05",

29 => O"05",

30 => O"05",

31 => O"05",

32 => O"05",

33 => O"05",

34 => O"05",

35 => O"05",

36 => O"05",

37 => O"05",

38 => O"05",

39 => O"05",

40 => O"05",

41 => O"05",

42 => O"05",

43 => O"05",

44 => O"05",

45 => O"05",

46 => O"05",

47 => O"05",

48 => O"05",

49 => O"05",

50 => O"05",

51 => O"05",

52 => O"05",

53 => O"05",

54 => O"05",

55 => O"05",

56 => O"05",

57 => O"05",

58 => O"05",

59 => O"05",

60 => O"05",

61 => O"05",

62 => O"05",

63 => O"05",

64 => O"05",

65 => O"05",

66 => O"05",

67 => O"05",

68 => O"05",

69 => O"05",

70 => O"05",

71 => O"05",

72 => O"05",

73 => O"05",

74 => O"05",

75 => O"05",

76 => O"05",

77 => O"05",

78 => O"05",

79 => O"05",

80 => O"05",

81 => O"05",

82 => O"05",

83 => O"05",

84 => O"05",

85 => O"05",

86 => O"05",

87 => O"05",

88 => O"05",

89 => O"05",

90 => O"05",

91 => O"05",

92 => O"05",

93 => O"05",

94 => O"05",

95 => O"05",

96 => O"05",

97 => O"05",

98 => O"05",

99 => O"05",

100 => O"05",

101 => O"05",

102 => O"05",

103 => O"05",

104 => O"05",

105 => O"05",

106 => O"05",

107 => O"05",

108 => O"05",

109 => O"05",

110 => O"05",

111 => O"05",

112 => O"05",

113 => O"05",

114 => O"05",

115 => O"05",

116 => O"05",

117 => O"05",

118 => O"05",

119 => O"05",

120 => O"05",

121 => O"05",

122 => O"05",

123 => O"05",

124 => O"05",

125 => O"05",

126 => O"05",

127 => O"05",

128 => O"05",

129 => O"05",

130 => O"05",

131 => O"05",

132 => O"05",

133 => O"05",

134 => O"05",

135 => O"05",

136 => O"05",

137 => O"05",

138 => O"05",

139 => O"05",

140 => O"05",

141 => O"05",

142 => O"05",

143 => O"05",

144 => O"05",

145 => O"05",

146 => O"05",

147 => O"05",

148 => O"05",

149 => O"05",

150 => O"05",

151 => O"05",

152 => O"05",

153 => O"05",

154 => O"05",

155 => O"05",

156 => O"05",

157 => O"05",

158 => O"05",

159 => O"05",

160 => O"05",

161 => O"05",

162 => O"05",

163 => O"05",

164 => O"05",

165 => O"05",

166 => O"05",

167 => O"05",

168 => O"05",

169 => O"05",

170 => O"05",

171 => O"05",

172 => O"05",

173 => O"05",

174 => O"05",

175 => O"05",

176 => O"05",

177 => O"05",

178 => O"05",

179 => O"05",

180 => O"05",

181 => O"05",

182 => O"05",

183 => O"05",

184 => O"05",

185 => O"05",

186 => O"05",

187 => O"05",

188 => O"05",

189 => O"05",

190 => O"05",

191 => O"05",

192 => O"05",

193 => O"05",

194 => O"05",

195 => O"05",

196 => O"05",

197 => O"05",

198 => O"05",

199 => O"05",

200 => O"05",

201 => O"05",

202 => O"05",

203 => O"05",

204 => O"05",

205 => O"05",

206 => O"05",

207 => O"05",

208 => O"05",

209 => O"05",

210 => O"05",

211 => O"05",

212 => O"05",

213 => O"05",

214 => O"05",

215 => O"05",

216 => O"05",

217 => O"05",

218 => O"05",

219 => O"05",

220 => O"05",

221 => O"05",

222 => O"05",

223 => O"05",

224 => O"05",

225 => O"05",

226 => O"05",

227 => O"05",

228 => O"05",

229 => O"05",

230 => O"05",

231 => O"05",

232 => O"05",

233 => O"05",

234 => O"05",

235 => O"05",

236 => O"05",

237 => O"05",

238 => O"05",

239 => O"05",

240 => O"05",

241 => O"05",

242 => O"05",

243 => O"05",

244 => O"05",

245 => O"05",

246 => O"05",

247 => O"05",

248 => O"05",

249 => O"05",

250 => O"05",

251 => O"05",

252 => O"05",

253 => O"05",

254 => O"05",

255 => O"05");

end mem2hex_map;

