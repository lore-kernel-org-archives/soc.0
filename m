Return-Path: <SRS0=a/FV=24=gmail.com=jbx6244@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9BFEC433FE
	for <soc@archiver.kernel.org>; Thu, 27 Oct 2022 00:51:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AE029C433D7; Thu, 27 Oct 2022 00:51:55 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C7C67C433C1;
	Thu, 27 Oct 2022 00:51:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C7C67C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id b2so281280eja.6;
        Wed, 26 Oct 2022 17:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zKQQQwNdmP0I/7sbEgciKRJH80dN4WVefIoocRKiN3s=;
        b=UxmhUtWDYn/Ae6ytp6eFL+jck/3SwSMRCNKSTifMbbyR3oX9qwJCmtQ/PUcfWiLcp3
         l00zgYXE+C16PItqTNArXlv2jbXvYzk2LDX8aeKZgP64K+H5t9xb+CPWLCE9qNZ4nLvu
         yi0mfrtoI/WKUh01I1UMoxsOrW8A4tt86uRtGOim8VxCwRrcRj70bCydOewQvh0yRVH1
         Vtdmz3BZ1mr1XDpYQ2eBW30Ut1eLE6BF8ABZukZn7fHVBpcnnQ9ILQXIYrFqH4roK9Iq
         2qgJVdyYCFaGPc3AmlaANX+/aRGrgfaTdoLcD4eMwRXg4uFmikTok4HkphdvWDCfwm7l
         +YWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zKQQQwNdmP0I/7sbEgciKRJH80dN4WVefIoocRKiN3s=;
        b=LDOY9bS/TXRKua103LYLccrENFWCcK11VrOB0StdbT3rslE/44jCjWZnz8INd2RLx6
         uCHtWeDOpqTlaJetJXEDTKMVXCUC9X0rtqiJyP7S8qKIfhgSAtBpKDQCUUYnpDr29Lyy
         nti2yeVNRKzOED6K88IJ4ElzxDWuttHqvxGFHc1U4BSZw2hsQ99pXy0l7IqMZWqTXwBF
         rvJ/vnTpOGqJLM2jfrZBN48INkJOsG6VTVO7IMaV6SlpYkOCsS2B+GwLMShuWsXgHkAZ
         bebcntnwaudglDGdPi4eV6bL8r2jCvJBU7zXBmzP0bzMR3O6dRggNEadc3Dpy4uB6AX4
         WFBg==
X-Gm-Message-State: ACrzQf2rKR1uvohBfJFIK/F3ixUJ2pevTpZ1LISQP8QD4ip1DnkRhZCg
	oRTv1+d3yPkqAoUoi9/xQ+M=
X-Google-Smtp-Source: AMsMyM6BPmm4tam1hIVqE5W6S7kMh5eIMq81+FlGsJXakTWmualZq8N+pHVhJ18p5o7fy2DyAl3kLw==
X-Received: by 2002:a17:906:9bca:b0:78d:bc5a:9137 with SMTP id de10-20020a1709069bca00b0078dbc5a9137mr41992336ejc.25.1666831913177;
        Wed, 26 Oct 2022 17:51:53 -0700 (PDT)
Received: from [192.168.2.2] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id bt20-20020a0564020a5400b004614fd33789sm60029edb.18.2022.10.26.17.51.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Oct 2022 17:51:52 -0700 (PDT)
Message-ID: <16afe467-7b9e-6e99-ca27-7eefce50a066@gmail.com>
Date: Thu, 27 Oct 2022 02:51:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v1 1/4] dt-bindings: arm: rockchip: Add Rockchip RK3128
 Evaluation board
To: kever.yang@rock-chips.com, heiko@sntech.de
List-Id: <soc.lore.kernel.org>
Cc: sjg@chromium.org, philipp.tomsich@vrull.eu, zhangqing@rock-chips.com,
 hjc@rock-chips.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 daniel.lezcano@linaro.org, tglx@linutronix.de, arnd@arndb.de,
 olof@lixom.net, soc@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <da1252eb-85e9-bdb8-0542-207173523523@gmail.com>
Content-Language: en-US
In-Reply-To: <da1252eb-85e9-bdb8-0542-207173523523@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Add Rockchip RK3128 Evaluation board.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 72bf2fbfe..e81d9d1ef 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -662,6 +662,11 @@ properties:
           - const: rockchip,rk3036-evb
           - const: rockchip,rk3036

+      - description: Rockchip RK3128 Evaluation board
+        items:
+          - const: rockchip,rk3128-evb
+          - const: rockchip,rk3128
+
       - description: Rockchip RK3228 Evaluation board
         items:
           - const: rockchip,rk3228-evb
--
2.20.1

