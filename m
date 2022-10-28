Return-Path: <SRS0=9oDq=25=gmail.com=jbx6244@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F9AECAAA1
	for <soc@archiver.kernel.org>; Fri, 28 Oct 2022 14:41:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3E30CC433D7; Fri, 28 Oct 2022 14:41:45 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 59023C433C1;
	Fri, 28 Oct 2022 14:41:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 59023C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id d25so8214450lfb.7;
        Fri, 28 Oct 2022 07:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=neowCr6oVr3vuPg1WjdiJZukZ1wtscf+gZ4yxqYQOrI=;
        b=SHZTjrmp9L29dDhO6NAh0ZPr0eez3l/Oxd5GjIFS18GwLCGLpjYvOk0miK/lOxzIZQ
         7Bb0siqxcEdzp0W3oRSh8Io0s0AMwR20GENJHCne0egP6cqfBfYMFWnTNwuNsknN2aC+
         j0Q4cFeH8clH73Ej4qqWRQJYb+L96vPXHJEipua3ZVlsj3PfPZmCBQ/WXhXyZ3m9xczM
         DnRwgdP+imsiKs/e+bW4TZfq6EaTivmNI7Dk5OcQ+gn8+2ezHmFAKUmX2SEF2zIADMr2
         wdF6cm+Q6pp0Q4MH8TVgsUtZkhsjPVFNvbCg3GNhUqtB1ST7RcDl8ErxvH0GcqHn14OM
         9uuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=neowCr6oVr3vuPg1WjdiJZukZ1wtscf+gZ4yxqYQOrI=;
        b=40/e0eRPD3yyDl8QgsnkvCUZpLTezI4xOchZTRmochF++xTaRma2XYazIZhyMzcVd5
         Ys0vzJPk/csHuum1Er3n+kdNM8a2OmQbbokUuexeY9SIFIWCS0FEMinFVTTUht/WSU+j
         1l8OO3RQ4bFAsYmTZOzaAM6NRCNh+59ggaH8RfpwI6MwMfLMJd+fYeiOrojueOvvAg3S
         cyc/GA8xBzRj23uSVFy0BWSX8Z2Wkc/hugj3AGIG/lnV1RgkaQs40hu2U321flg4TN5v
         bbIU+UeOWzyltxIzXKZK37MIiq7hZiJGwp4RAjZcuOPUI3U+ltqKIkBlhSxRp7lRNSfz
         kM6g==
X-Gm-Message-State: ACrzQf3L7/nVfHUZQDyePQUpa7U3+RrYMb+GUqxosWWqfOvtY32H2Uy1
	u92pQvDDfKfPTU4PFJcoFtYowf5lfrg=
X-Google-Smtp-Source: AMsMyM5OBcO+LDLOQHxISLu95CbLOxbNR+n9EWCWrV/yBJI/GkvE+GKGE/5SNpSkKQ4JuXH8kKV5yw==
X-Received: by 2002:a17:907:8a24:b0:78d:cd60:1022 with SMTP id sc36-20020a1709078a2400b0078dcd601022mr46727644ejc.384.1666968092017;
        Fri, 28 Oct 2022 07:41:32 -0700 (PDT)
Received: from [192.168.2.2] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id qh3-20020a170906eca300b0078dd4c89781sm2239439ejb.35.2022.10.28.07.41.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Oct 2022 07:41:31 -0700 (PDT)
Message-ID: <0e57f38f-bace-8556-7258-aa0b3c0ac103@gmail.com>
Date: Fri, 28 Oct 2022 16:41:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v2 2/4] dt-bindings: timer: rockchip: add
 rockchip,rk3128-timer
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

Add rockchip,rk3128-timer compatible string.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
---
 Documentation/devicetree/bindings/timer/rockchip,rk-timer.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/rockchip,rk-timer.yaml b/Documentation/devicetree/bindings/timer/rockchip,rk-timer.yaml
index dc3bc1e62..b61ed1a43 100644
--- a/Documentation/devicetree/bindings/timer/rockchip,rk-timer.yaml
+++ b/Documentation/devicetree/bindings/timer/rockchip,rk-timer.yaml
@@ -18,6 +18,7 @@ properties:
           - enum:
               - rockchip,rv1108-timer
               - rockchip,rk3036-timer
+              - rockchip,rk3128-timer
               - rockchip,rk3188-timer
               - rockchip,rk3228-timer
               - rockchip,rk3229-timer
--
2.20.1

