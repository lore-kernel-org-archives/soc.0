Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9663B0ADF
	for <soc@lists.linux.dev>; Mon,  6 Jul 2026 10:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783333115; cv=none; b=LbDzWAQNqyttrK2jReTBD6BOj/NViA4TUtBNOfnzB6TjBCGlhnPFnlJbJpGiuEWtfGGh1kQ5B6UFYOyXnK+h3PHUSYcokl/Sy1lRFPAh1waJsP+GIMAXJMMz6S40MlvIgl034aYc5zekRPKre6M+dQlcuxAGW9Dhx+eW9BZV7eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783333115; c=relaxed/simple;
	bh=J8fceL42EKDgvezoHCZX2Tw8NeF3KSJd25+8oOQeLGI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yyfhm6ajjV+hG9nQvjUKZp4/junAuEuOrtkDtaycdtSn0prPDnARxMbOHaeG/HMprWyEt47urOj3amSegbCwx//sVN5ZhXMRraSoqDSmH7H9zwaat0ZqAryYU0bdBU79ZPUac5dVgIvotfJhRxbW9/spJGGILW2lD1JrH5GgmaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XGMI8M3e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kPtdLjbE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XGMI8M3e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kPtdLjbE"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6669p5VU250548
	for <soc@lists.linux.dev>; Mon, 6 Jul 2026 10:18:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=aDo8MoMAOCa
	iYkrWr41kzSL9v9KKD5C6ukY8ewA9HPY=; b=XGMI8M3e4LdeqaHl9ceYdOhSket
	+h0mjNB3HwKueGnasSlh3QfXzk9ZYYKlH4x2V2VsMlxMImqCSvbBmHF3FCDoFdWM
	RItxRkWbERwmCVd+IYoGbWssvARDPpG6gKwFRhUNPfMFGDtIHG+jCVvGJbkhrS/G
	N6oJekey7owg15tHsGqB3VNx0+1kv/JhbqdJ/FZKLepFbOmi8Ur4d5eFBZpPdjh2
	xYwxwiPYeIdjJQBavV0LQRfHpeZFqzNOMfcAithZ2jzfKgEkJwqnn9qXh6lgNVLD
	w7a4jJ2sYRA5pm8QyJrRjplZKMI6OYGIVBPYMghw8eKb/6UCRJVFRKAAiYA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3gr3fk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <soc@lists.linux.dev>; Mon, 06 Jul 2026 10:18:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e663c29f2so298292685a.0
        for <soc@lists.linux.dev>; Mon, 06 Jul 2026 03:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783333111; x=1783937911; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aDo8MoMAOCaiYkrWr41kzSL9v9KKD5C6ukY8ewA9HPY=;
        b=kPtdLjbE6xedNxnZG+WsOTJp7sAMSG+elxHrZTQSpWBjaGlRRu8yOanGjBcL0bUQOv
         jSYfQG+6Xs4SYCFaEzx9Ns/8hhJs6amg75OuE/frIuMW2nZaABcWPF1J8Z+sdp9iclWB
         T94ARCLaYRXfb6wmKYGhvhknziFv/r4xoQw0geCXRczLObOvNHNLDBrDANKocfmJddf5
         phMbhXkGvLUbsoru900kU7ja6d1V2eZMe5U38TqNclIEAldv9Yuo9/GS++mtMcihIPGr
         rRZ8kLlLOZEYd56WCrL99XJJKRd/gjOihsyX9oXX8K4c175LEJZttzoADS4wWFt04i+S
         /B4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783333111; x=1783937911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aDo8MoMAOCaiYkrWr41kzSL9v9KKD5C6ukY8ewA9HPY=;
        b=Sbm/N+MziIfMmOyAlKN+ULzobqglbnuNvcbin+o8oEiXD8lZFRZDqa6eTv97UZLlZa
         ncw0FoLCXgB21RORkyPqDDc5qXg2Dvy3QLkbGNzZv5E7O94WACFSD2Sc0VuqK43LrT8/
         MEDqg1g6bjfUAh2gPg/OPFDQy07nOMy5FAGrvBsKWZOLZpYtLkBtc6uEutP9CPlMfXWR
         OSyrX/ptsMOlYDFWVWCINX6oj/EMVI/A6UYTUW9xtg7M1LSWKc//xwncjpiVKK8RbRbU
         U1oqMOkriSr9DxcUcmwutYn9ph+1l5OWxnH8MyaAlBWCf5Ca4ENEHpoZz/0d70TgwI+x
         NT5Q==
X-Forwarded-Encrypted: i=1; AHgh+Rq7pNmjY8m0C+gjoTb4ph0XEYFi2hlE738gBWuBBw7hGjac85IAF7cqhMv/b8JpFN1m+9g=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyvy8NrsDAPne+Soat+EkoXjFON/ra9tS7V336ZORX4+O66OXVg
	0VhNZWq4AffZcFzlFUZKI4gV9e4df7IeOx7nzTot7M0yf53Yh5Bf/L9jLshIhFtA17ysBHYzhW1
	cE/6kwWpP7IRzSvf80Mkb9MBlEJjFQhEw86UA2zDW8A9L4/viWSe1xfg=
X-Gm-Gg: AfdE7cnl1C38TfLiSrYEtbDMrCz2rCbDBjqZxGNO53qoYRU4ZeCJpU9bK/+oMLYKcdB
	xFu4x6DIejuGPt8gzrrowlFP13bKX8eFjvbxjcd9S7vDyrRFOrP6VjsHEG2JeeehST2sSXJ1K/h
	SLXus1kB5QelEgoaORRRZLJh8uNqCoR718roMr/W4RBiTk5JWJ0xKjBBrjA/Z4zkKxKPwAu3+Tg
	/PrAYbi0oth9PLxS4yrao8GWIp2pr1cQoUBdzZhsPwD7Jzm82FW+WCxhqKStB4OTuR6NMU9jK6R
	MLvSnybCAd5fWQS44mOGvPhrngSYRHEQRbg4fVs+XLjAzS9J5bY2WKVPBTa6j7JKfN0U76y3/Ln
	CQwR3P0tvSI6HLVg6ZDm+EIs5Y08=
X-Received: by 2002:a05:620a:4515:b0:914:bfca:7d12 with SMTP id af79cd13be357-92e8b25e823mr1742915785a.5.1783333111450;
        Mon, 06 Jul 2026 03:18:31 -0700 (PDT)
X-Received: by 2002:a05:620a:4515:b0:914:bfca:7d12 with SMTP id af79cd13be357-92e8b25e823mr1742910985a.5.1783333110963;
        Mon, 06 Jul 2026 03:18:30 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039bcdasm24350402f8f.21.2026.07.06.03.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 03:18:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Viresh Kumar <vireshk@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] ARM: dts: st: ste: Correct indentation
Date: Mon,  6 Jul 2026 12:18:25 +0200
Message-ID: <20260706101823.341230-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260706101823.341230-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260706101823.341230-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4345; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=J8fceL42EKDgvezoHCZX2Tw8NeF3KSJd25+8oOQeLGI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS4Dw2EQXufGRpxmk5Rid8ltVbS+lkrBjNViET
 5KJPgUjwJ2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakuA8AAKCRDBN2bmhouD
 12yzD/9SExFX4onHKFPfLA2LoB8/Wmf/a4TbrVGowWDUpYIEAW7kjaLY5UE5bwnLJ10Ts71c8Xt
 NhoixDDypxaKj9292THd1+wjz+ObgyF+v4sispqlf09zNod65LSjwtmyqeUHOQiqaEagEVcdKdq
 RFmbshpoNYzXAdykDP1ic999xNf4FSsBjhhftj43fIvcXOJpsJjXV02Zcrh3vMKOYbsicQqtPfm
 zV2wlQBoSQeOSyCEGYyrSi3ajC5k4OrSLm1MwCt9G0RdSf4jV43fEQFXCpjCx/leZlYbEjmXIq3
 rFDsxk87DZHu06J1KokFnhfE608C0/dYhtVU+4y8N4bD2B3diusPwoZlTP+GdWKuxs4jH05iI3V
 Jw+bQQT7DoWRaTqsGhqhCyyO8Mmq72iyIwXXr/PdSy47b8WxgemCN8N8lq6e0Dv/Ttecuq5Kl4+
 zS2XVQOt/i7K9nA7kbt4cSY5XSCoaIxwHlZziByCygpunhWczLXROG45OglIlu3ihl4Q6/hj6+y
 5ZeGCTXJbGa+ydGZ/j6wLhErFaXKQ87Z1uISvqqxZPiPmt4MphL67A++UQDODn/ce2voCtSGJP2
 NqvtDdpXNKInXwlJ4DFd6Zzqci9Tfs/OC36P1C3rFzoculNd1+TeB9wLCgEvW5VhjOxCAf58vqi IHiBC3T5YlH31kA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ZbtUigshq6mcmQunXA7m-z2jqI8YBWr3
X-Proofpoint-ORIG-GUID: ZbtUigshq6mcmQunXA7m-z2jqI8YBWr3
X-Authority-Analysis: v=2.4 cv=CPYamxrD c=1 sm=1 tr=0 ts=6a4b80f8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=muePWa0SRqB7cAwnof0A:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEwNCBTYWx0ZWRfXyDtsLXXheeKe
 WeMfbYEWvPP+SBj0n7loRkdBjkapdWbeMESTZFwann11Qm/Wa+2nIy/m1MJOH2yw6VgfsVyXacG
 y3zTCqgRXlHb9fnb9NgQkBxjeu6nWVDcFE1uus7L8H3blfrQtfwYFB0fa6qiHV+lwLwDzk5ehRP
 n3rnndTlGpehwfGpXxdpEGw82ED+ee5q2YXWFlM8vq/wAahzZhXEc+u/7PhwDS13Eu7/yY0/Nw9
 wJCg/wuGNwkVUv6PLabNOS0uiHnfcUOcCkX+zfbCZmvI+NQNdEl7+SfV63FQgTbV2G5JIN+93GS
 ZM+tyrVH/H/mt4qFffuJHf0iSFZPmD4NgyPBwsxior4gsYe2QTQcUHOSsBX0jfQfotgaDK7zCAM
 pqXeL8tntbxE5EAKVpGWJP+cgm3pL48iTytEIxs6IOzpIDqJj8Ido6wQlQ1550QfU4vq0VG4vJs
 DcnpaZ4r83vUNscWYtw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEwNCBTYWx0ZWRfX/prPcZ3AbO5r
 lgQT7cJO5xwjY4tBFBeDbweK7sLbOFZCuadCtIsmXc2yBDWQusGMbm3gVgTB5A4a5WIsVvgWdvA
 eEIKYBh2V6GgbuD77PdQ91ffpKbP8YM=
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
 arch/arm/boot/dts/st/ste-dbx5x0.dtsi              | 2 +-
 arch/arm/boot/dts/st/ste-href.dtsi                | 2 +-
 arch/arm/boot/dts/st/ste-snowball.dts             | 2 +-
 arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts | 2 +-
 arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts | 2 +-
 arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts   | 2 +-
 arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/st/ste-dbx5x0.dtsi b/arch/arm/boot/dts/st/ste-dbx5x0.dtsi
index 0f87abeddc33..25a20fafc6b9 100644
--- a/arch/arm/boot/dts/st/ste-dbx5x0.dtsi
+++ b/arch/arm/boot/dts/st/ste-dbx5x0.dtsi
@@ -1119,7 +1119,7 @@ msp2: msp@80117000 {
 
 			dmas = <&dma 14 0 0x12>, /* Logical  - DevToMem - HighPrio */
 			       <&dma 14 1 0x19>; /* Physical Chan 1 - MemToDev
-                                                    HighPrio - Fixed */
+						    HighPrio - Fixed */
 			dma-names = "rx", "tx";
 
 			clocks = <&prcc_kclk 2 3>, <&prcc_pclk 2 5>;
diff --git a/arch/arm/boot/dts/st/ste-href.dtsi b/arch/arm/boot/dts/st/ste-href.dtsi
index fbf0309e108f..a85d87665610 100644
--- a/arch/arm/boot/dts/st/ste-href.dtsi
+++ b/arch/arm/boot/dts/st/ste-href.dtsi
@@ -207,7 +207,7 @@ mmc@80005000 {
 		// On-board eMMC
 		mmc@80114000 {
 			arm,primecell-periphid = <0x10480180>;
-		        max-frequency = <100000000>;
+			max-frequency = <100000000>;
 			bus-width = <8>;
 			cap-mmc-highspeed;
 			non-removable;
diff --git a/arch/arm/boot/dts/st/ste-snowball.dts b/arch/arm/boot/dts/st/ste-snowball.dts
index 1322abfc7acf..14ed1079ff6c 100644
--- a/arch/arm/boot/dts/st/ste-snowball.dts
+++ b/arch/arm/boot/dts/st/ste-snowball.dts
@@ -295,7 +295,7 @@ mmc@80005000 {
 		// On-board eMMC
 		mmc@80114000 {
 			arm,primecell-periphid = <0x10480180>;
-		        max-frequency = <100000000>;
+			max-frequency = <100000000>;
 			bus-width = <8>;
 			cap-mmc-highspeed;
 			no-sdio;
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts
index ad9a20ccaaeb..0c3eef7a294a 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts
@@ -402,7 +402,7 @@ wifi@1 {
 		/* eMMC */
 		mmc@80005000 {
 			arm,primecell-periphid = <0x10480180>;
-		        max-frequency = <50000000>;
+			max-frequency = <50000000>;
 			bus-width = <8>;
 			non-removable;
 			cap-mmc-highspeed;
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts
index 64562a3a262c..18fb7263058e 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts
@@ -452,7 +452,7 @@ wifi@1 {
 		/* eMMC */
 		mmc@80005000 {
 			arm,primecell-periphid = <0x10480180>;
-		        max-frequency = <50000000>;
+			max-frequency = <50000000>;
 			bus-width = <8>;
 			non-removable;
 			cap-mmc-highspeed;
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts
index cdb147dcc1db..c34d43a2b750 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts
@@ -274,7 +274,7 @@ wifi@1 {
 		 */
 		mmc@80005000 {
 			arm,primecell-periphid = <0x10480180>;
-		        max-frequency = <100000000>;
+			max-frequency = <100000000>;
 			bus-width = <8>;
 			non-removable;
 			cap-mmc-highspeed;
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts
index 064d6fee8821..7bf4287f6e13 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts
@@ -253,7 +253,7 @@ wifi@1 {
 		 */
 		mmc@80005000 {
 			arm,primecell-periphid = <0x10480180>;
-		        max-frequency = <100000000>;
+			max-frequency = <100000000>;
 			bus-width = <8>;
 			non-removable;
 			cap-mmc-highspeed;
-- 
2.53.0

