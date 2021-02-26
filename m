Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85316C433E0
	for <soc@archiver.kernel.org>; Fri, 26 Feb 2021 18:01:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4832664F2B; Fri, 26 Feb 2021 18:01:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1E61D64F17;
	Fri, 26 Feb 2021 18:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1614362474;
	bh=K7ckSsBdRk9rkAeryus+c3Q4PuQkK1Uq+V7iFTKfGwE=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=DO3RSA62JjU1Rhi6oOfMEnru7cpXgSdRZ1pFYq/VXa/Dw1Op9KXTeTU3TZbDgGw2p
	 mydKgZeeJ+LHX6MyBdDcFtV+eZOb8131rzknEi2AFbPlrWk5K37TU6VSomvV73dxgU
	 AB9HY8elug/cpRQ1rlju37hq70BDJDRsnrT2g0GqPGQ6nXwEhVLO5lid91WCfuNXZ7
	 BnS+mdMZGv4dD2OBD3r/C3YV+7bbGNFSx9EjLc/V1A9s/SUeW5E5zMyy/HtJ+GFrQj
	 nUQksCQpKcPD9y5C1VH8W37KXDRQI/mfDkw9ZXtw8hcFdHj8U/INvDrZT4SyWMaeYZ
	 w+Kssb1JEpTIw==
Received: by mail-oi1-f178.google.com with SMTP id q186so10553550oig.12;
        Fri, 26 Feb 2021 10:01:14 -0800 (PST)
X-Gm-Message-State: AOAM532IBxjDRvsfAeKKL19MqxLKShCQ+VLR9keOh7DfCDSJUfM5wwjU
	3A/Ma/UyZAOOJMQcwlZcrpQtyc9KSMcGpateI9Q=
X-Google-Smtp-Source: ABdhPJzAqTkX5+PkGxMg1asdXRKWTDALsdIgq1ACEq8X71dP5w1l3DcYrd6GMc0V94kFGbIQ7FtZiXLmCBrwteJV7LM=
X-Received: by 2002:aca:4a47:: with SMTP id x68mr2769592oia.67.1614362473428;
 Fri, 26 Feb 2021 10:01:13 -0800 (PST)
MIME-Version: 1.0
References: <20210226164345.3889993-1-arnd@kernel.org>
In-Reply-To: <20210226164345.3889993-1-arnd@kernel.org>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 26 Feb 2021 19:00:56 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2E0pv6PKzcCoRZH0G_gGrhWeiDwN7h090iQpd6c=XG1Q@mail.gmail.com>
Message-ID: <CAK8P3a2E0pv6PKzcCoRZH0G_gGrhWeiDwN7h090iQpd6c=XG1Q@mail.gmail.com>
Subject: Re: [PATCH] ARM: ep93xx: don't use clang IAS for crunch
To: Hartley Sweeten <hsweeten@visionengravers.com>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 26, 2021 at 5:44 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
>  obj-$(CONFIG_CRUNCH)           += crunch.o crunch-bits.o
> -AFLAGS_crunch-bits.o           := -Wa,-mcpu=ep9312
> +AFLAGS_crunch-bits.o           := -Wa,-mcpu=ep9312 $(cc-option, -fno-integrated-as)

I reworked that patch just before sending it out, and ended up with two typos
in there, it should be

+AFLAGS_crunch-bits.o           := -Wa,-mcpu=ep9312 $(call cc-option,
-no-integrated-as)

I'll wait for others to comment before I send the fixed version.

      Arnd
