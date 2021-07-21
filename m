Return-Path: <SRS0=8gIh=MN=gmail.com=digetx@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44F65C12002
	for <soc@archiver.kernel.org>; Wed, 21 Jul 2021 15:29:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2D40861019; Wed, 21 Jul 2021 15:29:35 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08EC260C3D;
	Wed, 21 Jul 2021 15:29:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08EC260C3D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=digetx@gmail.com
Received: by mail-lf1-f52.google.com with SMTP id g8so3732794lfh.8;
        Wed, 21 Jul 2021 08:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=y3Me1H1g+i1iLWwjD1JZUPq0fs+AL+QhFF9DCBhI9X8=;
        b=pdVrpvByPApfQZfDso8ynert9Ks/VK9apcwGzpNoJqn7Rouyr4gipe/Z2tZ3ZjWtdj
         TGtZiyHT7zT7mOGEEUDDz+akJXDt23CQxPao9IkNYPs2lmw2j6BFHOQ/cfrOb/aAolwJ
         KNs/9RBtlB69C+OdnGFAYeQu01WyyWpU3PBhihHYEcej4SVhuTi49kvxzFw62ubTcB4Z
         gmTmbRAetA2EIIXEhtf9jALTyI4GFBoEdb2LhKlSz8YSeov6arMXi88XFXhJm501Es9K
         I1eGL+k/FulsJNsqncQufG7iWX4lXgNhC9lsO2Pjt3AWM6Gtxr9EJz9Kp+Z4nbo3vGL3
         NeLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=y3Me1H1g+i1iLWwjD1JZUPq0fs+AL+QhFF9DCBhI9X8=;
        b=qHpxkVlUPcM4SeD/NLtKtDId0k8cyEcCxOLeCnzvmZi1iKRjT/uaROJ69JjD+rdzpA
         FzAxUUSjgWTUdRUezWZX1mArGafrz9wGjnQmJC37hK5unX8E3mnZbhL77L2VXmMPGdpO
         RK7Dov7JGA8u8Fupp2stmt1XplNYmOvrc2MUsx0914D2c0LoFKe0DAOPsMCQoNhgf4lB
         NIhFQcTJo6nCuDTCd25G8aNZSF6KVpgAoDrgrSSKTgTW0ZQ4Ofu8iodCAIErZqltBVB4
         1Bp4QNLxs9k/fRWWyHBX7wqRtDmraBevYlre5+7/+gtz7kc+Zd/rwnx66QNkERmRDNeZ
         v6nQ==
X-Gm-Message-State: AOAM532YnVg1R06oa0r2UhyLWj9GqWBqwJlvjEAmU7kPmiPsnpW0g/MQ
	SrwMPu42Gdf7Q3OK5cbApIE=
X-Google-Smtp-Source: ABdhPJyFWzk8hSRWU933+n0cefcBs+yAZ5Nzg7Uh9cqxFc8FENPZPdOXpuP1HFMbLAERC7Mmw2czoA==
X-Received: by 2002:a05:6512:744:: with SMTP id c4mr25549643lfs.596.1626881373489;
        Wed, 21 Jul 2021 08:29:33 -0700 (PDT)
Received: from [192.168.2.145] (46-138-100-70.dynamic.spd-mgts.ru. [46.138.100.70])
        by smtp.googlemail.com with ESMTPSA id t17sm1943317ljk.102.2021.07.21.08.29.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jul 2021 08:29:32 -0700 (PDT)
Subject: Re: [PATCH] arm64: tegra: add regulator dependency
To: Arnd Bergmann <arnd@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Ulf Hansson <ulf.hansson@linaro.org>, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20210721151457.2285669-1-arnd@kernel.org>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c9968f90-0633-9467-a3fb-725b92116fe2@gmail.com>
Date: Wed, 21 Jul 2021 18:29:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210721151457.2285669-1-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

21.07.2021 18:14, Arnd Bergmann пишет:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The two regulator drivers in the drivers/soc/ directory fail to build
> when regulator support is disabled:
> 
> aarch64-linux-ld: drivers/soc/tegra/regulators-tegra20.o: in function `tegra20_regulator_reboot':
> regulators-tegra20.c:(.text.tegra20_regulator_reboot+0x4c): undefined reference to `regulator_sync_voltage_rdev'
> aarch64-linux-ld: regulators-tegra20.c:(.text.tegra20_regulator_reboot+0x58): undefined reference to `regulator_sync_voltage_rdev'
> aarch64-linux-ld: drivers/soc/tegra/regulators-tegra30.o: in function `tegra30_regulator_reboot':
> regulators-tegra30.c:(.text.tegra30_regulator_reboot+0x44): undefined reference to `regulator_sync_voltage_rdev'
> aarch64-linux-ld: regulators-tegra30.c:(.text.tegra30_regulator_reboot+0x50): undefined reference to `regulator_sync_voltage_rdev'
> 
> Add a Kconfig dependency to avoid this configuration.
> 
> Fixes: 496747e7d907 ("soc/tegra: regulators: Add regulators coupler for Tegra20")
> Fixes: 783807436f36 ("soc/tegra: regulators: Add regulators coupler for Tegra30")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/soc/tegra/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/soc/tegra/Kconfig b/drivers/soc/tegra/Kconfig
> index db49075b1946..c56122be27a9 100644
> --- a/drivers/soc/tegra/Kconfig
> +++ b/drivers/soc/tegra/Kconfig
> @@ -153,8 +153,10 @@ config SOC_TEGRA_POWERGATE_BPMP
>  
>  config SOC_TEGRA20_VOLTAGE_COUPLER
>  	bool "Voltage scaling support for Tegra20 SoCs"
> +	depends on REGULATOR
>  	depends on ARCH_TEGRA_2x_SOC || COMPILE_TEST
>  
>  config SOC_TEGRA30_VOLTAGE_COUPLER
>  	bool "Voltage scaling support for Tegra30 SoCs"
> +	depends on REGULATOR
>  	depends on ARCH_TEGRA_3x_SOC || COMPILE_TEST
> 

Hello Arnd,

Thank you for the patch!

I also sent out the fix [1] about a month ago and was trying to ping
Thierry. Unfortunately there was no reaction so far and now Thierry is
on vacation.

[1]
https://patchwork.ozlabs.org/project/linux-tegra/patch/20210621160739.22448-1-digetx@gmail.com/

It looks like my variant of the fix should be a bit more correct since
it won't build the regulator drivers if both TEGRA=n and REGULATOR=n.

I guess it should be fine if you could take the patch directly, perhaps
Jon could ack the patch for that. Otherwise we could wait for Thierry to
return.
