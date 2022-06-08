Return-Path: <SRS0=cZg1=WP=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D3A2C433EF
	for <soc@archiver.kernel.org>; Wed,  8 Jun 2022 09:12:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 18ED8C3411D; Wed,  8 Jun 2022 09:12:46 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7A6C6C34116;
	Wed,  8 Jun 2022 09:12:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7A6C6C34116
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id z17so17819334pff.7;
        Wed, 08 Jun 2022 02:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=fW/GsI6A8R+mvE9b7CONLo+jyj8NBZCnkmrcSV6IEak=;
        b=ohzQmVjPFUh12hG/i690v9W3BHDsT9l8y9sS8mA4RBOAjlr3MW5ium8/RAZ+UX5khS
         sCOG0IDkUNkt2bkp6v6xwMciw973fastwMqscU1e+u4bkHFG6wYyF2LLVRXJ1ULHmCBN
         bHEMRW6uOeNM1y+I63TSXbFBZ2e4EM8y/nIytphydYQUZR1rsM6ygCWjyig5kaubjHCO
         78lCxOpLQiAOe/lxfl0PkUxQBe2bz0MzWX6iBcr4TMMyhF9g9eVSKmm4teHeHYK1y7iH
         ksXOKVjvPSmpzRrTuoC3cvbvz/MxasVkiAwjqM1tkGpNpoBu8JZK6eHx2WvaWK8fkR+Y
         /8FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fW/GsI6A8R+mvE9b7CONLo+jyj8NBZCnkmrcSV6IEak=;
        b=S5kw9r/hyiVldZC3hVigElsnZXmQbTBBWVaKXDDrlSpuX6m2a2NzFkbbTn2xVBErmU
         DT15IZMPlmlpgDiEtte6X3R0UW8b4zyWObOb0KH3fs+V78nPKEZu4876K05ogFfxqtCq
         iFvKxc21EEVvWzPu40TpLpXIlvCHrcnumJ3jeSGT3rXfrCVIMam8sszkVLOzeAY1kvs5
         +PJoJyXixOwjj3PtE1XvkgELGmNHohXBufeimBzifJU2AMLoMOVmVdZKhiDyaili5E/h
         yhnMP3luuVmSsxOMXcZ16poVhgpE+tevjVBqaWYFci5d+9amMIV9WlAB+2/s1eG4prRS
         NexQ==
X-Gm-Message-State: AOAM533dcKno6otSqBGm9wMCIbYeVDJV6QsYGsqwxWogMiefKuRgHNiP
	Lnkv60qzIj9kGZfaXfu2fTQ=
X-Google-Smtp-Source: ABdhPJwiImHtG/1xmbPak4kelUGsGilLTjp7jGhE3AiEzmvz9x9KgNb4Lacvlz8VwSMAqOvv77jHeg==
X-Received: by 2002:a65:6d97:0:b0:3fc:af2f:7be8 with SMTP id bc23-20020a656d97000000b003fcaf2f7be8mr28652515pgb.246.1654679564765;
        Wed, 08 Jun 2022 02:12:44 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id o20-20020a635d54000000b003fae8a7e3e5sm14301074pgm.91.2022.06.08.02.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 02:12:44 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: bcm-kernel-feedback-list@broadcom.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: broadcom: adjust whitespace around '='
Date: Wed,  8 Jun 2022 02:12:42 -0700
Message-Id: <20220608091242.1461212-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220526204339.832296-1-krzysztof.kozlowski@linaro.org>
References: <20220526204339.832296-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 26 May 2022 22:43:38 +0200, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> Fix whitespace coding style: use single space instead of tabs or
> multiple spaces around '=' sign in property assignment.  No functional
> changes (same DTB).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next, thanks!
--
Florian
