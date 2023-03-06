Return-Path: <SRS0=lXKQ=66=i2se.com=stefan.wahren@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9A02C64EC4
	for <soc@archiver.kernel.org>; Mon,  6 Mar 2023 17:30:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8D172C433D2; Mon,  6 Mar 2023 17:30:39 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BBDEFC433A4;
	Mon,  6 Mar 2023 17:30:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BBDEFC433A4
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=i2se.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=i2se.com
Received: from stefanw-SCHENKER ([37.4.248.41]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MEFrX-1phB3609X3-00AHTH; Mon, 06 Mar 2023 18:23:13 +0100
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Evgeniy Polyakov <zbr@ioremap.net>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-imx@nxp.com,
	Li Yang <leoyang.li@nxp.com>,
	Denis Ciocca <denis.ciocca@st.com>,
	soc@kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <stefan.wahren@chargebyte.com>,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 1/8] dt-bindings: vendor-prefixes: add chargebyte
Date: Mon,  6 Mar 2023 18:22:42 +0100
Message-Id: <20230306172249.74003-2-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306172249.74003-1-stefan.wahren@i2se.com>
References: <20230306172249.74003-1-stefan.wahren@i2se.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:GmRbHadQVwqC+mg7raRvcxSwI16pBkcDjYkmfckT06Qp86+EKtq
 U79lbWonJTVU4EBP9bZ0OZllQyqlCpueGZSzYg8XHWk0L8t6PVjXH25qBdM/eirWQS0Sq2/
 fQj9WVUUU1Nta5jp/TgFGzbBO2+qa5k+tnGZaz6A+2/YGGvggne7OudC6az/Up96ACb0tgd
 hBJSfLO6USTz00bj/gieg==
UI-OutboundReport: notjunk:1;M01:P0:OqzwthfL5YI=;NHGEZ0WjEkwd5oPuG4HrGE23wX5
 wNcAhHkTddcnvpoVT5oQDaJ+h4h7DbemUuWqsE2a3MhKf4qMsMbwEU8X+M1djJ0wpUJ7NjyvW
 y8zcqgBtaBl/saXebN/7KquSJDxRiB75QgV4sGxsIzMtr8c3sTWCszvbcuettLRtFj/JUQYDO
 1d1s8W0HZTDxY7FaIJ5t4+OKVzTQV0qyX808lhujy3oiPV6/vQEZtp/5fEMgLdz4PLUsI9mOD
 Dhq3yygWBnU67mrs7usfHYdy6wsbLqjJRPpr6Av3CRVKi/HQ4wXYDag2qq2j4UoYcds1MDNp3
 0YQAReaECw42+xKMJ+m9Qyw+owsgEFQG3B/y48lsUwapQ2bsvkuiWf2u/yJV/BUvWtOZQlNPr
 Z068M9+0L1xkOLR0aISDfMQTY8W7wHfiwFYQ8EvEDKI/ecsexgNDmGpXGnFGF9X/yOigvY46o
 qqU3u64xnhhZ+mGRt7u1ce/EbsItwmHhMjnruE2QFwhFWzgU144FczwsbxbpPUtOODabybtmX
 vKN84row3zDCYBZubGxWT++p4r+s4d035dxWYcuAzUNwFKuGnMSJH9XH1Q0NTSGu/I6W87nUq
 M15jaosRoc8tRPPjZKf0x6PSpqk4bhAMlMe6bT3KEqStx2ZWUaSIfJNVwoY5luir2S0LeiugM
 IXkP6+ToOV8sPzEg2k8y23sajFBQYECYK1Dtyf1b1A==

From: Stefan Wahren <stefan.wahren@chargebyte.com>

chargebyte supplies hardware and software products for all
aspects of charging communication.
https://chargebyte.com/

Signed-off-by: Stefan Wahren <stefan.wahren@chargebyte.com>
Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ed64e06ecca4..b8d8fa1d1fd6 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -240,6 +240,8 @@ patternProperties:
     description: CellWise Microelectronics Co., Ltd
   "^ceva,.*":
     description: Ceva, Inc.
+  "^chargebyte,.*":
+    description: chargebyte GmbH
   "^checkpoint,.*":
     description: Check Point Software Technologies Ltd.
   "^chefree,.*":
-- 
2.34.1

