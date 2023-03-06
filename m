Return-Path: <SRS0=lXKQ=66=i2se.com=stefan.wahren@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A100C64EC4
	for <soc@archiver.kernel.org>; Mon,  6 Mar 2023 17:23:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 02CD9C433A0; Mon,  6 Mar 2023 17:23:44 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 04ADCC4339B;
	Mon,  6 Mar 2023 17:23:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 04ADCC4339B
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=i2se.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=i2se.com
Received: from stefanw-SCHENKER ([37.4.248.41]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1M3lkT-1pYxZQ0Hqd-000tYL; Mon, 06 Mar 2023 18:23:15 +0100
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
Subject: [PATCH 4/8] dt-bindings: iio: st-sensors: Add IIS328DQ accelerometer
Date: Mon,  6 Mar 2023 18:22:45 +0100
Message-Id: <20230306172249.74003-5-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306172249.74003-1-stefan.wahren@i2se.com>
References: <20230306172249.74003-1-stefan.wahren@i2se.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:wQRPex7XRzipPrnANRDADxZJE2vb54rgHl+nepAI703ge7CdZAd
 wBQQEv8D5RoFYWvTcdUDp8/wxCc0OVffAnl6LIf8bIjT/OQ5+j2PMyqSTNjOpeqI0rL6+23
 2oT0eaxJKFcb5uHJtU9XR1Or0NwKNLIyEGEO7mgrjLURo94lhq0Aj+oKQK50DaIlPh8reIr
 1RHw7cZPZfig5/B+kzmEw==
UI-OutboundReport: notjunk:1;M01:P0:2sDwh7PkhG8=;M3XqNZ4rhms1Stj2/5vNtVLQwfl
 kpHEE1eayt996RXZyq/JLFEzualTgBHZrx1WVkoHAKuygRw5S4UzSLVS0XEurlHe8yzT9IAyR
 hvCKZV2FbGrjkWYwz+gDOh8ltdg4po0XQiMVPFjs1isB6MBpbB8QzmbqDUvVyr0DoxZtYwVsW
 dw9DAeMwukSI1qw6CIBeuPO/qwWeZKbpgppuDIOyphGOKJWdUnJlsWG+lCupO8342jMkzFanc
 ahDaqMr/hrmxolDgHzB+43q60Hf1KZimaY1if44ByDm+E2vZd6uTvlte7jHyjA+yw6VGFvPNg
 kcQqzxLhjF/bWK4mS/uUrEs61oZpX9zHKihsQfzR7FKr6CLtTrUwcerZsd5ZIgQ6nJCDw+xc5
 70FK0567vr6bQkHcXBDdr0ut8FdSXoDzrh2wdRfT3Rob+DAXKFIQSihlITWj4WsGCCULDzEp8
 hCgQ0882ndnYUE/rCHk931oTr0dih4Wi6gEe/9kpYAS0VktAcjB1LZa3KxyKdvjxiX3q2vSnx
 9MycMde1j9gBZo4myRecY43SbnhiExxOqfdhIaZ9WDMA84SD64vF+0gNSKWXwayvv/Hu0vrKv
 RUgYHOKmZZh7+C/Cl3RKF4H7R8OmggB7mhDxTEmRVZEcU9CTpGsYc7vF7aVVUg+rLOMrmSZ+r
 +pqdM76w4Jfb4+UO7fb5ritG4Q0Pi9a2H9YnsKMQ91Yh3Azq8213XjNKonxpWG0fMhQyqgE1K
 04rjKx7D2xjcRUJdx5jHwBF/P4nebMydA==

From: Stefan Wahren <stefan.wahren@chargebyte.com>

The ST IIS328DQ is an accelerometer sensor compatible with
the existing ST sensor binding.

Link: https://lore.kernel.org/linux-iio/2bac9ecf-9d2e-967e-9020-1c950487d781@i2se.com/
Signed-off-by: Stefan Wahren <stefan.wahren@chargebyte.com>
Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 Documentation/devicetree/bindings/iio/st,st-sensors.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iio/st,st-sensors.yaml b/Documentation/devicetree/bindings/iio/st,st-sensors.yaml
index c6201976378f..247700537aa8 100644
--- a/Documentation/devicetree/bindings/iio/st,st-sensors.yaml
+++ b/Documentation/devicetree/bindings/iio/st,st-sensors.yaml
@@ -25,6 +25,7 @@ properties:
       - description: STMicroelectronics Accelerometers
         enum:
           - st,h3lis331dl-accel
+          - st,iis328dq
           - st,lis2de12
           - st,lis2dw12
           - st,lis2hh12
-- 
2.34.1

