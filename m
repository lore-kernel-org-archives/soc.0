Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9E13A4535
	for <soc@lists.linux.dev>; Mon,  6 Jul 2026 10:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783333113; cv=none; b=DGulmm0YnTRTCPSHhcOJkljj/iJ8VrLM9ONDXjR/MMf7PYqCsbVp2f+sWXU3u/iif3HyOgCZO/yzemOxuERpbO0hfswT6zVqwOXDej32Py0FjvmqAG1eUNoV6WAl8H7ok6f4ZZsMSs5tPl/xXBr9PPeymBieoHjc0aPakqKtLk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783333113; c=relaxed/simple;
	bh=nff7ht1yXQQDMNVSlXjX5TIDnXVQzTUA7YgPGwIziis=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S7nL1TIxkRkiojXTlUB8qbNuGjsj+7b53WcLbRCh7jXuMPDqlvNY77R9zzvYr0OMjOhHQiCk8ziQWEirTjLddR3TySzojDhTeKPXmVH4dUB048hZ8SQB78VNajJvw17TjGYF9g4V7qs1FHpn66Wvg1ZvenyodiCuPJjh5oYoGdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QVAipDdg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FEirhQ2S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QVAipDdg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FEirhQ2S"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6669p506250543
	for <soc@lists.linux.dev>; Mon, 6 Jul 2026 10:18:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=0FrDalQwcquWAJmomCrjMYRMMztrlBrdWqd
	DN1FmStg=; b=QVAipDdgnOnegBEWVFPNGDU6Q7ta3zSKVdl6+vvkIxW9v7ejUjw
	4vGz17FdRz7e8MpY19IaqMwtod9frSMn7IVhc/IsBBzrYFE/qAZO2ZilFcVEQ/Og
	ARelPn+jVXykqf1f1yCRt+81jL2mH+EiLLRyHIR30bmTBsLX5yzBtlDmG5sAcBdP
	r3g47USO1fNR5Gni708g19yOQ6UARkggFDfTmPGeLXNmZ6D/fVTId4qZvrzeAhOZ
	yiGJhGB2jGSz8jaC5lzuEHN0XBko47rnZasEgCKh+ZFSOHnOZC+LWnO2AR6i4+Zz
	LJ6QJIFOta4N/kWScA1p/7pDjM5ZoIxn0Ww==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3gr3fe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <soc@lists.linux.dev>; Mon, 06 Jul 2026 10:18:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e52306621so201431785a.1
        for <soc@lists.linux.dev>; Mon, 06 Jul 2026 03:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783333109; x=1783937909; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0FrDalQwcquWAJmomCrjMYRMMztrlBrdWqdDN1FmStg=;
        b=FEirhQ2SevX6CGXD1hreWAme/+BCE8DXoEyVFjIQlZAwyQBqmsmdRCsMX/9sasvTbK
         di1n08moMvpZOdb0NA8tnPas2D1Y8brb0ZQ70tKNAE8/0kd91AA/PbGomRM99W1FQY6e
         svaH297sazt6yjWMMVp/uLWKLt8Z1hhL7/ZlEGJInvrLXRvcpmwGVZ/FM4KMi45YL5f+
         6GFMKmYh6tT8Ku6t4KeZSWccmtbr2GHf6UfUIgcYKl2h5csf445LAW14seB172f+gvp5
         /6EyffVu7miIizJHVcclodbkpvhZHTyg22H1kvh7phoIJ5g3C02NlDpEJFEJP6TIv0DP
         B2Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783333109; x=1783937909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0FrDalQwcquWAJmomCrjMYRMMztrlBrdWqdDN1FmStg=;
        b=KqztZOnnlT7ZqztAclx+cuKma7SVqpLDNAFBVZaaDF62+v4X4DJPLZbDbriSdxDv2i
         QYofO/f2tQwxGLEVNwkZ+yddVndYmxTK4yJvMxfzQpgmVJ60X3B5zGxiiekt+fI07UDG
         s2LKvhiTx386oJzajnE0e6pse4H/E00Ujvrn6dNiVyk9OaofEkYyb39OszlTqWMA6nax
         xoJFMAc7yo86FPXv+mD2v88BYp+Nf3/wTzYxED0pRBZBc/fWkTToQeC0i7v0A1Hk8XPC
         qWI3mM0v4ofPRXCl/XKAn3cg4pd1CWV+Xq7/lGktUUq57quYE0t0ieQV/xOiVFzdOkZX
         AjAQ==
X-Forwarded-Encrypted: i=1; AHgh+RpG8Kw9QRxSgWL6Yh6iZEhJKMUrweiAJyOpXdRFTS0Fc7lLrcrcHww28DlAjYCndqXGmqc=@lists.linux.dev
X-Gm-Message-State: AOJu0YyA+j774TBjmoURffzJ4dgqSRGS+fHC9rwKeG1+jiFOUwjPF4La
	Ow+qUOPkve1H7UkyyL0dYaBvIPr939GQrK5H4LWUn1F+DwUch7S+UtPW5TyVb6g8uETYPPtV874
	HK4Rkbp+CHYWP7k8PuFicOn53LIpGT46KEjbnt5dIWORgJB6OzNhio5g=
X-Gm-Gg: AfdE7clbDsKXp2iBW+i1KeJDwJJrufNVwlF2WUSH0GFSYDfwGGNKGcP5X1wD7vylfrO
	TQKf7lyYb0gcH+YIeuHICKq+Epeo8v0uQwkty1/9hrNVUCGa7Xkr5jbudXVIgNxE1hJHzq7QpZS
	qGrTWATXBQRQfUAMP/VfPAA7bvCfq3Aeb4CEEdYt4uhQe/wprBhz93dxhEGc/Y00xm1AanhxsKn
	NF64zcNbHWKUVw1Z6jv1fJ25Mh5LMHW0mi9HVsFL+WagrCeqA2UN9R2y5BpXUUHG3cwZfA0GAc1
	89MDRKEHLXBpdo+4Krt3z1AfIYW6LQ/Hm19gMpMbzv6fFkjv5k30/3pwI8yhCtkoRpW16lPKgOj
	7C6hWUYzt88Cleyog6+0Cq+D40Ak=
X-Received: by 2002:a05:620a:17a0:b0:92b:7420:bd5c with SMTP id af79cd13be357-92e9a34978amr1349008685a.5.1783333109256;
        Mon, 06 Jul 2026 03:18:29 -0700 (PDT)
X-Received: by 2002:a05:620a:17a0:b0:92b:7420:bd5c with SMTP id af79cd13be357-92e9a34978amr1349007085a.5.1783333108852;
        Mon, 06 Jul 2026 03:18:28 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039bcdasm24350402f8f.21.2026.07.06.03.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 03:18:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Viresh Kumar <vireshk@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] ARM: dts: st: spear: Correct indentation
Date: Mon,  6 Jul 2026 12:18:24 +0200
Message-ID: <20260706101823.341230-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1358; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=nff7ht1yXQQDMNVSlXjX5TIDnXVQzTUA7YgPGwIziis=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS4DvDRsgTbbK816wZrc6DJ9az0YAYQwCYh5MQ
 K8yDMBfIsaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakuA7wAKCRDBN2bmhouD
 16wxD/wNLAnDh7ULEKoI6+hQ3BIQw34nWRVPCv/Uh3YRBQM7E9DAeheYRgAW6UfHMvhggU289H/
 4OyfK4/9ZteddRjb1KS9hGH1d5y3yPnd5H5yGz+OzxnMeW2m3LTBvfk4YeKzO0fY1R1krRx5lN+
 gY1omWSpohSrIwRNvtxrnujAXgGENqPpXQ3sxqF+y0Lc+8wGVBpFtDsFxVcBd8nE9vf0yvm3DBn
 iFqgxTQkPWObGZelOTCkqAUn/14d3Dn/F22SkONfnwQk+Uc5mNxfJokrIZKT/P3tTyu9Ef13orr
 G4+k2vv8SyDUnoZRStdOyCSGHAvNxpKM7PUn1OupYPzVFecjm4YBk4gisqnjzpfharWQT8H+I2L
 Sk+cJGVrDYf/8OVHYqfgSrNHcJpQPrPpRUalqN+AOaGEoUJLKHlGWe4YimYT4q+oYonaJqYN6iK
 SnK/uWIPWbeE9hqrMGDG1mHJD8C2gYHvJAdGwNMusEh4rRAfXET08Axjo9LOKwuR939xFukA2NV
 Uy+wLKmJ6SS3nkriHxkVHP8pIvrw8ybCW8Eg6O6MVCprQdkdZVBdw1WmY59UlTcWK9iwoZ9ZyaM
 ZcE9/Eb3X086yMd6ByGJAavOqSn00qwoc3gMId/9xBO8DP4TGU9d1WYgv+G7RVe41MRlqbRayzK EOZtdWWNVELW9ig==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Mt6C81rBPhKLbEZQ15ebLAJ7EETktkQB
X-Proofpoint-ORIG-GUID: Mt6C81rBPhKLbEZQ15ebLAJ7EETktkQB
X-Authority-Analysis: v=2.4 cv=CPYamxrD c=1 sm=1 tr=0 ts=6a4b80f6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=52rqv5wQVAuTtBApVRAA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEwNCBTYWx0ZWRfX0UlQZzm3c4T2
 a81jSdmdCEXV682yhNWTGvjq1OqcdcOOI0lH+JcXJkUUOVYPVRhFbwMJ7P2LB4sxQ+vDcMmYXy/
 U+bMO7X+dzN7/0RhX5lByLCru3uNCGzv5qTvLmjRJHgLHG8MadcgH3cFcbdE/F8T1qKQcNHIWrt
 Oj+UTTDWa/xT7grtZ4DcbkWHvgADL6FeI02CRy3Bncy9L+Iof5r9FSU8Rk5m5VhldyXga04qW6D
 Tb2W6M7g/kdrs6x9VfCx3ig8N28aEdhkkB6MIgKVic1BG2bzbjyaXGxPi7ELHGx71gANy7ZMjyV
 znAAdjYuWx97/PESpnZxYhuUqO/gWYezb6jNXr/ghLXLKoVXcjLkj9NDplq0ceUoRMk38ogKbQ1
 sjBrJqx2J5OefeaulNsby0jHSXpK6FsE8I/VpT2dmEZkwdEoPeOL9NtgEe9KFY0Dg0R4X0Azb1b
 Jdk2BRELLOvRGGRRIuA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEwNCBTYWx0ZWRfXxPj+Lzu2AlND
 Huhx00H3p8G32yLVMIEPEo1XQ68b02qae16kJ8pROnERPogwaTSX4r+UCD324HiYnCG6KBfpl1R
 XlB1BTztncgt6ylI+7tpxHtHimDXfsk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060104

Correct spaces or mix of tabs+spaces into proper tab-indented lines.
No functional impact (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Ongoing bigger work for all bindings and DTS with built-in checker (dt-check-style).
---
 arch/arm/boot/dts/st/spear1340-evb.dts | 2 +-
 arch/arm/boot/dts/st/spear320.dtsi     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/st/spear1340-evb.dts b/arch/arm/boot/dts/st/spear1340-evb.dts
index 9e7c356b1d9e..133015a5dd46 100644
--- a/arch/arm/boot/dts/st/spear1340-evb.dts
+++ b/arch/arm/boot/dts/st/spear1340-evb.dts
@@ -259,7 +259,7 @@ sound {
 			stream_name = "spdif-cap", "spdif-play", "i2s-play", "i2s-cap";
 			dai_name = "spdifin-pcm", "spdifout-pcm", "i2s0-pcm", "i2s1-pcm";
 			nr_controllers = <4>;
-		        status = "okay";
+			status = "okay";
 		};
 
 		spdif0: spdif-in@d0100000 {
diff --git a/arch/arm/boot/dts/st/spear320.dtsi b/arch/arm/boot/dts/st/spear320.dtsi
index 56f141297ea3..cbf494419f43 100644
--- a/arch/arm/boot/dts/st/spear320.dtsi
+++ b/arch/arm/boot/dts/st/spear320.dtsi
@@ -82,7 +82,7 @@ pwm: pwm@a8000000 {
 			reg = <0xa8000000 0x1000>;
 			#pwm-cells = <2>;
 			status = "disabled";
-                };
+		};
 
 		apb {
 			#address-cells = <1>;
-- 
2.53.0

