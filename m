Return-Path: <SRS0=+cAE=PB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55EF6C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Oct 2021 15:03:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 250F760F23
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Oct 2021 15:03:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 250F760F23
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XseoDtZylU9ztp8OtZ0dcPryrwucQpvV4q0Xe1pfmEo=; b=gC2HVCjPwjAcLz
	GGvn2Jq/8C16RLmaCf3gN1GkxUaQnYUF/LuPHDq6dookOk0cdhcsmidygq3dO/qsnOQxgve/Y/yCf
	EyTPNA28s2qAPKnm2H0hRAFfMu+fAxt10OQG7kuzRlkdPknTlJpMQw796nJBeR7Mhdppfh9sx4TX7
	c5JOQgDDiyNYOH8Kk7jw9ZtiS2YE3N/xKqT0hYQ1doiLNq4SczBUsrCPv4Hia+I2NsMsyjfq+6bof
	1JtCR2kygYHzovdB9lDkkbxmmo8YNYETzM8b2XS/5w0CugqHpL0QZWCa2yUgTyHWm4bGM8bq6FLUy
	OktQReEMAaZiocRv3iXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mafl4-00HHMz-US; Wed, 13 Oct 2021 15:01:31 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mafkz-00HHL9-0V
 for linux-arm-kernel@lists.infradead.org; Wed, 13 Oct 2021 15:01:29 +0000
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 4204E3F077
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 13 Oct 2021 15:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1634137276;
 bh=xYuV2MmQladXcPP7bw44n/vAd85hc1wnSNxzKdpoKHU=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=h/QXGNQ6m1uR7tRK3CIgv+bWw+nupVn7pe1kAe5t9gLcWICbqxFktHubqMlefJyXZ
 r9h/t08O0MBlx3IK3OB0k+exGFDs55Zs+JezlrzE6UtYngOOJQsf6SVXd2+QPql2Ex
 omo5Zh/p+ywpyP2Z4NPqn0X9bmxlz2Bzi3lDwV4tC5uZ9Vg8Wbs93ORlvyuZRZ20rQ
 9o69lMx7hNW9oRyHC/o09MJSDcgx8mpp4P/vShDjdMR/yR1U1xyQFxyumsND5uE59I
 I9+CwOPfynNFba8zHE7e7RDXwvUUBp03k6Le/XRWTqfNbsXtAIR2jD6uK+8cDnHxem
 T9zFtS9pJZ13w==
Received: by mail-ed1-f71.google.com with SMTP id
 c30-20020a50f61e000000b003daf3955d5aso2517399edn.4
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 13 Oct 2021 08:01:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xYuV2MmQladXcPP7bw44n/vAd85hc1wnSNxzKdpoKHU=;
 b=mGSZ5bgRUUE1MeG2XOy+NL/U8FeYzAu0CuCdoFjzcG45gLl5U1/59orWmh1ISScm7P
 vSsEBdk+35vWKm/29gk90WJvTMnwePJnT+O5wp+CyLPGJLOmh4Xm9ctUbFBBHnToxAOz
 jaq7dUw19YoHCyOrWHeaTbgwe9Rdd/5JNtNJ0l6lYW0GftUMUcsykyg6/9//6ngRpj15
 Zzk1K9HxNvxqF1akFgtCfzTNCm8061iDZaL69g1CoctzfVguI13JKszsFwYIJgD26pug
 pDagSqhVPfbGRiwz46UygkYX5TiClU2Jg5cIe4eAXoFC20N5um3eubWr6zsh2CsC6xvI
 220Q==
X-Gm-Message-State: AOAM533NFSYZ4e1kxU4Z0Y2Ij4j28cyYWDOnSi8RwjIXW1EhaMd49O4v
 pVy0D94R+yFazq4genJHkjeZzAyzrRcn30w1M9LiQiuJ53reIpmUGbhslHjq3LEqoXRDSOWpBcW
 Uypn6R2OrA5SH8LTOgJirfUM4pg96jTRQ3d+rTVYQtqEREacG3N52eAGWKrmg9M+8yken
X-Received: by 2002:a50:cf87:: with SMTP id h7mr10281319edk.330.1634137275949; 
 Wed, 13 Oct 2021 08:01:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwegVNQSzIUZzqwL+kBl/pg71DIpq9sCZIiDU4Wb8xJespMOYwK9v10kYYfIdkQ4bJOR0ucGyI5yMK1rTxX1ro=
X-Received: by 2002:a50:cf87:: with SMTP id h7mr10281285edk.330.1634137275716; 
 Wed, 13 Oct 2021 08:01:15 -0700 (PDT)
MIME-Version: 1.0
References: <20211013143810.2101838-1-arnd@kernel.org>
 <20211013143810.2101838-2-arnd@kernel.org>
In-Reply-To: <20211013143810.2101838-2-arnd@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Date: Wed, 13 Oct 2021 17:01:04 +0200
Message-ID: <CA+Eumj5Fx6tQv9B9R9iBCP4C=f2dk3szCGcisvPHYfMWpsCCfw@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: exynos: fix cpu unit name warnings
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Chanho Park <chanho61.park@samsung.com>,
 soc@kernel.org, 
 Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_080125_308485_F4590217 
X-CRM114-Status: GOOD (  13.40  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211013150104.4s1xN55vWckFnvJmR4cfTYN2TtVmqm-GaFHs4zSvPYM@z>

On Wed, 13 Oct 2021 at 16:38, Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> dtc started warning about some of the CPU addresses:
>
> arch/arm64/boot/dts/exynos/exynosautov9.dtsi:78.20-83.5: Warning (unit_address_format): /cpus/cpu@000000: unit name should not have leading 0s
> arch/arm64/boot/dts/exynos/exynosautov9.dtsi:85.20-90.5: Warning (unit_address_format): /cpus/cpu@000100: unit name should not have leading 0s
> arch/arm64/boot/dts/exynos/exynosautov9.dtsi:92.20-97.5: Warning (unit_address_format): /cpus/cpu@000200: unit name should not have leading 0s
> arch/arm64/boot/dts/exynos/exynosautov9.dtsi:99.20-104.5: Warning (unit_address_format): /cpus/cpu@000300: unit name should not have leading 0s
>
> Remove the leading zeroes.
>
> Fixes: f695b3f4c45d ("arm64: dts: exynos: add initial support for exynosautov9 SoC")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Thanks Arnd, but this was fixed with the next version of patchset.
It's my bad because I did not drop the patch from my next branch after
spotting it, knowing that Chanho will resubmit the next day and then I
would replace it. This replacement happened next day but linux next
got the older/buggy patch.


Best regards,
Krzysztof

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
