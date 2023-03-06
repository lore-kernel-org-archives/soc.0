Return-Path: <SRS0=lXKQ=66=i2se.com=stefan.wahren@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34759C6FD1C
	for <soc@archiver.kernel.org>; Mon,  6 Mar 2023 17:30:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0348DC4339C; Mon,  6 Mar 2023 17:30:26 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 32326C433D2;
	Mon,  6 Mar 2023 17:30:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 32326C433D2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=i2se.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=i2se.com
Received: from stefanw-SCHENKER ([37.4.248.41]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MwQOx-1qPPlc3CFB-00sJUB; Mon, 06 Mar 2023 18:23:13 +0100
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
	Stefan Wahren <stefan.wahren@i2se.com>,
	Steffen Trumtrar <s.trumtrar@pengutronix.de>
Subject: [PATCH 2/8] dt-bindings: Add DS2482/DS2484 as trivial device
Date: Mon,  6 Mar 2023 18:22:43 +0100
Message-Id: <20230306172249.74003-3-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306172249.74003-1-stefan.wahren@i2se.com>
References: <20230306172249.74003-1-stefan.wahren@i2se.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:v9b3X29P5y5UzsVy968V/rYnVligG5hrFWkTJJqhBc6P5bT3Hja
 OuJPC/hzzWeTbBSD6bVfxc2xfZNPCsPVvB3GUm6EzyQKFycjQ6ahADYR8CgKuITfSNegaSc
 bfHwfIDqWwyRjrzR5noOlUhehCWJT1xr76Y3fEHvVU5sWM5CTva0mjGpAr+IjcRURV5W07b
 h0FNhZltncbKSnCIt8lvg==
UI-OutboundReport: notjunk:1;M01:P0:LD2s6YOqI7U=;Nnh5nD5J+j9wSsPmtTvo8PZ9AVd
 ynPbd3ZLM+glzH7akk46HOXLkcDAf6EVMylWp7pM8kxBidPO8OrMVJfzZQ7IkKvMEDY/jN7Yo
 XWsa4SSM4KjX5hTVzNx1Hhf2Bv4Of6lVFavA49JAGX3y2zebyHwgycoykFU+Ks4CIdy0evdFD
 9lcutVrmEPjdjI6CKEtZZyiTV/VfgLubxvjx5RIHQCKcF/7XPACrt+/ZK3aQUTdWmR3cG4j2v
 QpNBt9JqxwXcfR2u3mmwigku64x6rvZ/i3PqOk1/jBLTUqEkTD8ew4nKubSoQVbAy5M/ftTxc
 KYk//iOeiLmi+ZixJPxGKz3BYwaX73mIle8K2kwnsRClJgH7dbyHN3cuDYvwT2/I/lLkT73gG
 /KxO+KdPsWH7qjGdTS3a+xes9WGFkeHTPZqneWtAvHE/gft2OYyMnAYENyFv/1o7Qa2R5fViF
 lqVxcmftd7XoellEwLIKZpK9P+YdUVOgGni7TnoM6bLYQlIfb/wCR86ZE7U6qmo1F9v1dix+t
 J7bdEO+U7NzGErgpqUWQInoqaLX+kZrXegnBRbnYMQ4lTyoa88AIZD7q1A7wKzT5jUXOG8Z1G
 1LzKKdWw38dxYQUVKyM1RqWUbgOhr6HIfuRZnYu2YfLXts5CnK/QO8cLRWdkshMTRGjKEOd3o
 wngfC1Gw1KTQE7iakWNQMxDykgLjNPAEzD7atGL+ml+CYmZlgp1G6MwSdmck6RTJBThKMCRMY
 jN7P2dTkZBSgu/cBLy9i/I2RRB86Ji7lQ==

From: Stefan Wahren <stefan.wahren@chargebyte.com>

Both chips are I2C to 1-wire bridges.

Signed-off-by: Stefan Wahren <stefan.wahren@chargebyte.com>
Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 6f482a254a1d..9b7b24989359 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -183,6 +183,10 @@ properties:
           - maxim,ds1803-050
             # 100 kOhm digital potentiometer with I2C interface
           - maxim,ds1803-100
+            # I2C to 1-wire bridge
+          - maxim,ds2482
+            # I2C to 1-wire bridge
+          - maxim,ds2484
             # 10 kOhm digital potentiometer with I2C interface
           - maxim,ds3502
             # Low-Power, 4-/12-Channel, 2-Wire Serial, 12-Bit ADCs
-- 
2.34.1

