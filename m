Return-Path: <SRS0=1Azg=XN=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AD05C433EF
	for <soc@archiver.kernel.org>; Fri,  8 Jul 2022 21:00:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 10FB8C341C6; Fri,  8 Jul 2022 21:00:51 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5E6E7C341C0;
	Fri,  8 Jul 2022 21:00:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5E6E7C341C0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f179.google.com with SMTP id s206so23318696pgs.3;
        Fri, 08 Jul 2022 14:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eiJSmomcbHamte6wVYKlfnPmeVECX+cd/OIOwALCfbs=;
        b=Y7JXD9tKxLp/rIH8LwnmsaWTmblzBxuRwjNJQU9DzsYTLZXwkE9MkgSDH+BC66EzrE
         92CJRClPfy1c0dgMzisTNKV3g1wf/wCzQ7rmtQE2es+Nxg1OiU9D9rOkeUulCL8qSe84
         DE9AzAHPjmNc7jAjK94mUht/3RQMOI/vGe9/stlA3pFsDArGxByAo8FwYt59wRtSdTqe
         B/oYaoQtHfgz01k3bd8QKmyhd3yFAAnEEK0QQPg5+TL7AP53RHCCa8OvzAqbybR7pnFK
         OQ3KlVLIzRDRREDZ01js7iwI/yrThtOxacRJkw6N9meMRMB7WeRpNQ/wkK1KmkePaD3L
         iNPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eiJSmomcbHamte6wVYKlfnPmeVECX+cd/OIOwALCfbs=;
        b=f2vPdCBGIKGW4ZUVN4Dx/3zhYhC2vyOXSVsTR8qt8gBXZ6/Nb/TV1kp60PcvBo+sXS
         UZmf4mIJei7iBwpKlONsdiDGhMVRujMu6iplOw+k3P6dhmgYp01zfpjgyKojUabwxkpZ
         UVoU64AJwxgTbJuxgsA7be+cda7Pz3nFs+9yv8JOQF3K45dIdrY53DFe4E70bUhz/jEh
         uYzG0R9TJi374bEXyrFZFOwMQqxn2ifXoLKg2utNLpQPcVRGsNQ7gD5oNBvHJE9G9kKm
         hoAe6bVaazgILmpQnFDsxWLqy8ZLWMCit/9QfcdNpkC56J9aoFIjptrkKqYp3tGYZzaf
         A0Hg==
X-Gm-Message-State: AJIora+6W4zWZICU4vBBOlqyDwMlWKx88fgxPtTgN5fxNdKjs/prPTO6
	1Rssb+ZfJesR5TNLKZkx9x8=
X-Google-Smtp-Source: AGRyM1sDEsLmN38LuJJdCcccO2oNjMj/Z40bKcO+y3pr98pU2dKeP6r07wU+lEsPu7l1hAqbvzljmw==
X-Received: by 2002:a63:258:0:b0:40d:3156:6d61 with SMTP id 85-20020a630258000000b0040d31566d61mr4903970pgc.190.1657314049823;
        Fri, 08 Jul 2022 14:00:49 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id h23-20020a632117000000b0041245ccb6b1sm9576927pgh.62.2022.07.08.14.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 14:00:49 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: bcm-kernel-feedback-list@broadcom.com,
	William Zhang <william.zhang@broadcom.com>,
	Linux ARM List <linux-arm-kernel@lists.infradead.org>
List-Id: <soc.lore.kernel.org>
Cc: joel.peshkin@broadcom.com,
	dan.beygelman@broadcom.com,
	kursad.oney@broadcom.com,
	anand.gore@broadcom.com,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Olof Johansson <olof@lixom.net>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	soc@kernel.org
Subject: Re: [PATCH v2 4/8] ARM: dts: Add BCM63138 generic board dts
Date: Fri,  8 Jul 2022 14:00:47 -0700
Message-Id: <20220708210047.2477279-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220707070037.261532-5-william.zhang@broadcom.com>
References: <20220707070037.261532-1-william.zhang@broadcom.com> <20220707070037.261532-5-william.zhang@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu,  7 Jul 2022 00:00:34 -0700, William Zhang <william.zhang@broadcom.com> wrote:
> Add generic bcm963138.dts file.
> 
> Signed-off-by: William Zhang <william.zhang@broadcom.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian
