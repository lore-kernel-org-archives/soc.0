Return-Path: <SRS0=9oDq=25=gmail.com=jbx6244@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82271ECAAA1
	for <soc@archiver.kernel.org>; Fri, 28 Oct 2022 14:41:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 41F53C433C1; Fri, 28 Oct 2022 14:41:17 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2874CC4347C;
	Fri, 28 Oct 2022 14:41:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2874CC4347C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id d26so13373769eje.10;
        Fri, 28 Oct 2022 07:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SVxJ12c1A+xM0aCvd/9/hnx+Wg8Tkv2AsxQ0FKrV7Fo=;
        b=e8PuIJKYvVwZG8pMIVdsuACZ9hgCDCdCOOm6qZ9QEXRFloflT70eDzvCkEx02u8Eda
         A9wmqY1bfVxFQ7oZGfaGC/LFp3NhBBLwH91Llp1msKGVILazbrSIe6cz1PnC2rbhAWuG
         Lap2dQLywubkbNeFVdmBrX4fKMuAJfbKnLCuICMcD8nqoeoeEBFL6zO7Juarwj1CcA4A
         vaCof7MQlpnqykdvT6ZcdfNYA4jnC9IAuW5VPOKgSFKZzBvnU3qQta5s3ZkcRxzvG5H4
         5QCPzg0derVXMseJUguLo1RS7bwdblG31/bqP9a92i8FRKom98aLXGBHzvsYcTDY88Cm
         URYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SVxJ12c1A+xM0aCvd/9/hnx+Wg8Tkv2AsxQ0FKrV7Fo=;
        b=1rmrTzqMG31XbrRnoy0Z9SCU0qvB4fu6tv6cweCzrYeRF3goJtON+jPoMIv4bdcGaG
         Z8A1NxWJIi30bZtpKKt0YL0Wp+S7kXUqOU5dmtnOxEMrbOsOBERKYMJcU3QbbiNPu6KT
         lZ866di5CpNqotEkaqvp4myeYjo/q24/WjfqfbSsPD1swQYV0Um5TzUKYktrF7HJtlkJ
         s32sTHKvU25pgTeZiMexeeL64/tRArFxD6Ac4rvRk7ve5oWRl54Ryed5CtWRmCHqPlnO
         WdrTHeCS2PqNAYjyvMIjYmxqObXlX8b9fHb2JuSxSiym/fAQK2jSlHFQTHZNeUviY74/
         9Kvw==
X-Gm-Message-State: ACrzQf2F5iTGJGF8HAxkjazAagZ983iowP+TEzRXzmNDHCeMeGuw6K3h
	3xeM42b1iwr1fnKmc+r/8ww=
X-Google-Smtp-Source: AMsMyM7HXQ72bbrXuPMgRLSwI+e9C5ONtGcWO383f1AvM3xeoYFRDCq0hKSnjGHViuvp1OXIqoWYtw==
X-Received: by 2002:a17:906:730f:b0:791:9b75:2ca1 with SMTP id di15-20020a170906730f00b007919b752ca1mr45292306ejc.140.1666968074370;
        Fri, 28 Oct 2022 07:41:14 -0700 (PDT)
Received: from [192.168.2.2] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id my7-20020a1709065a4700b007417041fb2bsm2237114ejc.116.2022.10.28.07.41.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Oct 2022 07:41:14 -0700 (PDT)
Message-ID: <dca18633-54d4-1264-725c-213d82fdf1c5@gmail.com>
Date: Fri, 28 Oct 2022 16:41:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v2 1/4] dt-bindings: arm: rockchip: Add Rockchip RK3128
 Evaluation board
To: kever.yang@rock-chips.com, heiko@sntech.de
List-Id: <soc.lore.kernel.org>
Cc: sjg@chromium.org, philipp.tomsich@vrull.eu, zhangqing@rock-chips.com,
 hjc@rock-chips.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 daniel.lezcano@linaro.org, tglx@linutronix.de, arnd@arndb.de,
 olof@lixom.net, soc@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <e83964fe-ad87-0905-4586-e235757c6b2b@gmail.com>
Content-Language: en-US
In-Reply-To: <e83964fe-ad87-0905-4586-e235757c6b2b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Add Rockchip RK3128 Evaluation board.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

