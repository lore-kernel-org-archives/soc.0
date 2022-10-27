Return-Path: <SRS0=a/FV=24=gmail.com=jbx6244@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D85CFC433FE
	for <soc@archiver.kernel.org>; Thu, 27 Oct 2022 00:52:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BF993C433D6; Thu, 27 Oct 2022 00:52:39 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D1ACBC433C1;
	Thu, 27 Oct 2022 00:52:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D1ACBC433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id fy4so292827ejc.5;
        Wed, 26 Oct 2022 17:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ybHFtQFlusC5omeu3YXQVOdQ/jnkll+XG3jlSuR3Z1Y=;
        b=JRZ5QquTA8oO61xvU2RT9SeJAOYaBWyQ2l+uIIixfdmu63ujGYkC46hk5q4a+6b4SM
         sWjQyS+RR8cE2sJOlq3cDGyLhewgzgSgCxgCa1ok5Xo2T2bqe59lPXBQdQjHcBpDbLfV
         7kAGDXLfNCIJy+ooMHI8zIANbWDh9H51ioEx4ySqhg3eu/7xs/oxJ6JLePP44H1RpDPv
         T2NWMQuTeHDBO5593g5jkbnY+uVT+Ih6UlY+sdT0VQE4tWcxg6LkRAo2XtEeRTt4Xicp
         RtcHZnKDztvyoWvx33XPB+TjdY8Dt5pJyVZfkHCmwQo1gEp+KaG+3PExt3OGOP/JCJ4L
         thUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ybHFtQFlusC5omeu3YXQVOdQ/jnkll+XG3jlSuR3Z1Y=;
        b=JAo+MvxBzqtUfN7Pu2PV+nMktzReH8B9FDfll+sZv4LttkhdvkSd9mpwx/AIKTYz3F
         KwmY0t8uipmpHgZIa9duvQlMB6sHE9A487FKPkea6vDHPNa3mbdFIgzdxqDu41gh5uaK
         /EsPZLQceQMxfglV/C0Oytism9V+gfmi+iYUl8tLGYFdQR92u0U1sX4HkRmETkCSAiz7
         GZYW+3CQWhzcE//2nP62Xtix2FDs/fyU19pgfvlRKlfn0SjkaRBr5qDtptXGKLhWgqnv
         fogPSASIo2elzGRQDSZcENS8URP+5JauJLjj54TgyqnYbu13XKKpVbxYNf545w7jHHkh
         Yxcw==
X-Gm-Message-State: ACrzQf1X2pA5U2QLSJ+P1NJjNbOYvQr9xNfH3y49UT2tZVDJBZToYWr1
	EL7XTLQmXA+VugNHYhDjQKA=
X-Google-Smtp-Source: AMsMyM6+8P4B6n5+dZShu0ejqohqVlGyYoGYsVAKNdJ/Y9b8hANB/L2EB3YodE1KW9Ov62LNLFPiGQ==
X-Received: by 2002:a17:907:3d91:b0:78d:f675:5659 with SMTP id he17-20020a1709073d9100b0078df6755659mr38947525ejc.92.1666831957083;
        Wed, 26 Oct 2022 17:52:37 -0700 (PDT)
Received: from [192.168.2.2] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id u9-20020a1709061da900b00781dbdb292asm3677685ejh.155.2022.10.26.17.52.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Oct 2022 17:52:36 -0700 (PDT)
Message-ID: <939d9e2c-4431-5408-5884-12d328b6a4f2@gmail.com>
Date: Thu, 27 Oct 2022 02:52:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v1 2/4] dt-bindings: timer: rockchip: add
 rockchip,rk3128-timer
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

Add rockchip,rk3128-timer compatible string.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
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

