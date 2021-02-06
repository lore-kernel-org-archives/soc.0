Return-Path: <SRS0=0nBm=HI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB7B7C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Feb 2021 13:47:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EAB364EAD
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Feb 2021 13:47:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EAB364EAD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CPtmqUaLr6swjxoXnNwUvhmHh8mW6SiqsvZH1gCfpAE=; b=h96t8gw78cwBcOGzf9KqJL4SJ
	WO5ZKN6AS3lpOOB4T5H2pNkdttak/OHvoTLQJ7E3x9uaeH7qDZawlMtZGE92CJjlkY1O7Kh/YXUb7
	EX279sIV8Jrb0gFivvUrPZYz8GRzfwM4GsfTetqMshv/Fy7BiVn6KqvvUwKjag9GB3y+QFKeyWul/
	502mWxGdyl++367uj+zBKiTX5J5NCii3MttvrC8laDwfSw3GqdUrNKDl3G0RPD72XDfCqSk3nc5mr
	ksKrSrbbtZtjIt3EwsiXfLqOWbXdKEj9rbj5chfCTOeT+X7b3NTZSU9EdYQEvQ4IjtTKmxLg0/8ZY
	6i50I/BWQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l8Nu7-0004Lw-3m; Sat, 06 Feb 2021 13:45:39 +0000
Received: from mail-wr1-f46.google.com ([209.85.221.46])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l8Nu3-0004LV-1D
 for linux-arm-kernel@lists.infradead.org; Sat, 06 Feb 2021 13:45:36 +0000
Received: by mail-wr1-f46.google.com with SMTP id v15so11063511wrx.4
 for <linux-arm-kernel@lists.infradead.org>;
 Sat, 06 Feb 2021 05:45:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7ghVbTm1KHFPZQbBwYfJEJHbvho+CoG+hwSpE/oCZOc=;
 b=blQtfpml9C1sBiT6hwucdfe9DkOrDcizfxUNX1u0TsSrduTTc+sweqDd70rWZY4Rk2
 cWEHCradD1KPEhaKAouhj28jSv7qGpYsV1q7nvu/dos1WePj/Ifx4c7Jt8VpMio5Rp3n
 3hR0sLpBD1qIUXHFemQj1ICv7s6qnKvWuWgYlOgnjHHgXELJIINJuX02hwyHORLrY4sb
 6nOZVi4btobYyEEcAAF1NERd+kXaGMCcuJQbfqjhzh1KcNgOuW+XeIb7H4tTqGaZjQ/4
 HPnR6TeVeL1VsOsXvoce0aEzDpEdmhjiGE2AXD3wn2kH0YBVPY/dprLdk0HWBNT/4K8T
 raMA==
X-Gm-Message-State: AOAM532F0h7yFeiIEfuW1gDSI9pJyZKlm1l1aKi4DjhoqL/gyZ1b2FYx
 qSSvyH1GallQjvHc7vEXFQjvGdhvoZY=
X-Google-Smtp-Source: ABdhPJxfZL4HL+Mq28hXXROX5oDPXTtbYpNw5IDUR7G1wwpEwQJWkmQ95FfU7I+FNgdfeWWCNapjdQ==
X-Received: by 2002:adf:e807:: with SMTP id o7mr10750502wrm.308.1612619133829; 
 Sat, 06 Feb 2021 05:45:33 -0800 (PST)
Received: from kozik-lap (194-95-143-94.dyn.cable.fcom.ch. [94.143.95.194])
 by smtp.googlemail.com with ESMTPSA id w14sm16387610wro.86.2021.02.06.05.45.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Feb 2021 05:45:32 -0800 (PST)
Date: Sat, 6 Feb 2021 14:45:31 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
 arm@kernel.org, soc@kernel.org
Subject: Re: [GIT PULL 2/3] ARM: dts: samsung: DTS for v5.12
Message-ID: <20210206134531.l5vpzlmev4v3f3uo@kozik-lap>
References: <20210125191240.11278-1-krzk@kernel.org>
 <20210125191240.11278-3-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210125191240.11278-3-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210206_084535_108477_F996529E 
X-CRM114-Status: GOOD (  17.07  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Sylwester Nawrocki <snawrocki@kernel.org>,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210206134531.KKK38UzUwc3bgxVe6rtVl8eNM7HxE5MGao_cmqkXQ7s@z>

On Mon, Jan 25, 2021 at 08:12:39PM +0100, Krzysztof Kozlowski wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-5.12
> 
> for you to fetch changes up to 3803f461bd28c1c817281348509399778633e82f:
> 
>   ARM: dts: exynos: Add top-off charging regulator node for I9100 (2021-01-03 17:33:29 +0100)
> 
> ----------------------------------------------------------------
> Samsung DTS ARM changes for v5.12
> 
> 1. Use new compatile to properly configure Exynos5420 USB2 PHY, fixing
>    it suspend/resume cycle.
> 2. Correct Samsung PMIC interrupt trigger levels on multiple boards.
> 3. Correct the voltages of Samsung GT-I9100 charger and add top-off
>    charger.
> 

Hi everyone,

Any progress or new comments about this pull request?

Best regards,
Krzysztof



> ----------------------------------------------------------------
> Krzysztof Kozlowski (6):
>       ARM: dts: exynos: correct PMIC interrupt trigger level on Artik 5
>       ARM: dts: exynos: correct PMIC interrupt trigger level on Monk
>       ARM: dts: exynos: correct PMIC interrupt trigger level on Rinato
>       ARM: dts: exynos: correct PMIC interrupt trigger level on Spring
>       ARM: dts: exynos: correct PMIC interrupt trigger level on Arndale Octa
>       ARM: dts: exynos: correct PMIC interrupt trigger level on Odroid XU3 family
> 
> Marek Szyprowski (1):
>       ARM: dts: exynos: use Exynos5420 dedicated USB2 PHY compatible
> 
> Timon Baetz (2):
>       ARM: dts: exynos: Fix charging regulator voltage and current for I9100
>       ARM: dts: exynos: Add top-off charging regulator node for I9100
> 
>  arch/arm/boot/dts/exynos3250-artik5.dtsi      |  2 +-
>  arch/arm/boot/dts/exynos3250-monk.dts         |  2 +-
>  arch/arm/boot/dts/exynos3250-rinato.dts       |  2 +-
>  arch/arm/boot/dts/exynos4210-i9100.dts        | 30 ++++++++++++++++-----------
>  arch/arm/boot/dts/exynos5250-spring.dts       |  2 +-
>  arch/arm/boot/dts/exynos5420-arndale-octa.dts |  2 +-
>  arch/arm/boot/dts/exynos5422-odroid-core.dtsi |  2 +-
>  arch/arm/boot/dts/exynos54xx.dtsi             |  6 +++---
>  8 files changed, 27 insertions(+), 21 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
