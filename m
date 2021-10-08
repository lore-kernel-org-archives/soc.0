Return-Path: <SRS0=fGbl=O4=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7941DC433F5
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Oct 2021 11:51:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49C6760F41
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Oct 2021 11:51:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 49C6760F41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WS+y3jtKpA2oNK9AS9+qAVlh4l0hWwK1lXNbqPXyPDI=; b=Zqafm7J59zkD1s
	kUUo76TkzifSSxnMc+oR1ivqmVKqB8vN51kFnPk4lB5U6pWIwy6JF0Xg9tQyBoOpU6r2PIETt+wA6
	NT/twpXRLvvRv78Ff+ChIGjx8b+r/DnHfgclq+4L6jwvBsW8z7EBRPJxLfJ0MKYz0JNJvfyBLZrYV
	0RnSA/4+XKYGCdhUd8IH1mscki24HOE0aW+jG2ZmTxZQ8KAGQhPiur5Y7iQoVYDjD/YUHEwdI6Qfs
	StM7xJ3KY+dfBtpml5LCOngK4zzI+jKlolrdeOhmcG9UzggeY7HYhPjaBYrtrCFYaH9SH8X27B+3n
	zF6laTPJnsANo9NDXdlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYoNZ-002c5t-P4; Fri, 08 Oct 2021 11:49:33 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYoNV-002c4v-Ox; Fri, 08 Oct 2021 11:49:31 +0000
Received: by mail-wr1-x434.google.com with SMTP id s15so29051366wrv.11;
 Fri, 08 Oct 2021 04:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=i1USBJq9F3A9TOJZg6Wun0mkV6fuM/zyzzq0ur+ZWkM=;
 b=TrHWFpZk1hBg4BNeXKvJbfJJ6DVgKu9vSyROmzcutuCtBP92iFon9Hc1IwCieShoQS
 P8bm62d+2+YpgbV0vEr6jKoElMLYWATbfJJJy4Me3gj3kTU2aZyKrY1dnFMetszxksfN
 y+mJJqVCUGGI6ZcO4AFrStPUlOHviZQyzLBnreYPS9hlZ9ZSWCU57gU7DA/s9tnwz+cD
 2ueenDzipjfvutsEc1ucvvwRsFSlh0aTG31vhnThuAaoUIE5bHfP8WjNoSijfObZwcJc
 u5Fm5XOe3OfhoXavxGGVujBqPU2Tzpf0erk8uuVL+1dvUizbvf+eOwziXnI0iv0joknT
 RVww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=i1USBJq9F3A9TOJZg6Wun0mkV6fuM/zyzzq0ur+ZWkM=;
 b=NZyA045HJNON1lsZVspKSUPkrzwnQ0UoLhmFp6P9RXBydth5pVMmysWgk/F/kvhxwa
 BzR15rB1hxi+xkLJ4sAVd6YiGqo75BvuuxjyG+W9h3poNaHop5g41OMCJO+k8GHViswX
 yjz7zKf85Mzyj+Yeq0g//IjjSmo2/KkJRR/oVmNjBCx4WbMMwtNGDaYaxvyRiCvzDUFk
 2106Vue43GqZ2f/lPu6D9rIjHNymX+1ryjls3fRjnonD/lOov6MOKh0pTQprm/B+K999
 yk1NfyeOxnVYcMAAN4nkRPBYfM4ufxeoX3D6AOxdKv83BmtbCbSthBBOxAgloez8joM9
 Embw==
X-Gm-Message-State: AOAM532MiSdBQT6t8pEoUv322s20hJ+kNLccub8kFcIgHlBhOxgHFjdr
 VxZKPUpQjX6m4uykc3HosFA=
X-Google-Smtp-Source: ABdhPJwEb1M1xAqD7t+bZHRlFTnnVa7+ol3EKhZKsTwrkNUouAJXScKLX+w24KKdd+gB+6dDenYqSA==
X-Received: by 2002:a5d:64c3:: with SMTP id f3mr3501505wri.73.1633693767284;
 Fri, 08 Oct 2021 04:49:27 -0700 (PDT)
Received: from [192.168.2.177] ([206.204.146.29])
 by smtp.gmail.com with ESMTPSA id a81sm2342283wmd.30.2021.10.08.04.49.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Oct 2021 04:49:26 -0700 (PDT)
Message-ID: <686404ce-2e0b-5470-b095-1c1fd7c18250@gmail.com>
Date: Fri, 8 Oct 2021 13:49:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH 2/2] arm: dts: mt6589: Add device tree for Fairphone 1
Content-Language: en-US
To: Luca Weiss <luca@z3ntu.xyz>, linux-mediatek@lists.infradead.org
List-Id: <soc.lore.kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, Arnd Bergmann <arnd@arndb.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Fabien Parent <fparent@baylibre.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>,
 Sean Wang <sean.wang@mediatek.com>, Seiya Wang <seiya.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, soc@kernel.org
References: <20211005202833.96526-1-luca@z3ntu.xyz>
 <20211005202833.96526-2-luca@z3ntu.xyz>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20211005202833.96526-2-luca@z3ntu.xyz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_044929_854331_EEBABE52 
X-CRM114-Status: GOOD (  23.96  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211008114925.-hDL0Es1DN80eNpT9QLq5WpOfA6x204v92x2K3zsGt0@z>



On 05/10/2021 22:28, Luca Weiss wrote:
> Add rudimentary support for the Fairphone 1, based on MT6589 to boot to
> UART console.
> 
> The recently added SMP support needs to be disabled for this board as
> the kernel panics executing /init with it, even though the CPUs seem to
> start up fine - maybe a stability issue.
> 
> [    0.072010] smp: Bringing up secondary CPUs ...
> [    0.131888] CPU1: thread -1, cpu 1, socket 0, mpidr 80000001
> [    0.191889] CPU2: thread -1, cpu 2, socket 0, mpidr 80000002
> [    0.251890] CPU3: thread -1, cpu 3, socket 0, mpidr 80000003
> [    0.251982] smp: Brought up 1 node, 4 CPUs
> [    0.254745] SMP: Total of 4 processors activated (7982.28 BogoMIPS).
> [    0.255582] CPU: All CPU(s) started in SVC mode.
> 
> [    0.472039] Run /init as init process
> [    0.473317] Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000004
> 

Would be nice to find out why. Did you tried to boot the system with 
enable-method set but with bringing up just one or two cpus?

> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>   arch/arm/boot/dts/Makefile                 |  1 +
>   arch/arm/boot/dts/mt6589-fairphone-fp1.dts | 30 ++++++++++++++++++++++
>   2 files changed, 31 insertions(+)
>   create mode 100644 arch/arm/boot/dts/mt6589-fairphone-fp1.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 7e0934180724..24f402db2613 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1437,6 +1437,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += \
>   	mt2701-evb.dtb \
>   	mt6580-evbp1.dtb \
>   	mt6589-aquaris5.dtb \
> +	mt6589-fairphone-fp1.dtb \
>   	mt6592-evb.dtb \
>   	mt7623a-rfb-emmc.dtb \
>   	mt7623a-rfb-nand.dtb \
> diff --git a/arch/arm/boot/dts/mt6589-fairphone-fp1.dts b/arch/arm/boot/dts/mt6589-fairphone-fp1.dts
> new file mode 100644
> index 000000000000..32c14ecf2244
> --- /dev/null
> +++ b/arch/arm/boot/dts/mt6589-fairphone-fp1.dts
> @@ -0,0 +1,30 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2021, Luca Weiss <luca@z3ntu.xyz>
> + */
> +
> +/dts-v1/;
> +#include "mt6589.dtsi"
> +
> +/ {
> +	model = "Fairphone 1";
> +	compatible = "fairphone,fp1", "mediatek,mt6589";
> +
> +	chosen {
> +		stdout-path = &uart3;
> +	};
> +
> +	cpus {

I'd expected "&cpus" why can we overwrite delete the node property like this here?

> +		/* SMP is not stable on this board, makes the kernel panic */
> +		/delete-property/ enable-method;
> +	};
> +
> +	memory {
> +		device_type = "memory";
> +		reg = <0x80000000 0x40000000>;
> +	};
> +};
> +
> +&uart3 {
> +	status = "okay";
> +};
> 

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
