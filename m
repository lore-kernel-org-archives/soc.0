Return-Path: <SRS0=0nBm=HI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F7F8C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Feb 2021 13:14:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 490CC64EA1
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Feb 2021 13:14:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 490CC64EA1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OfwRrHR/RhsVZeMD2VgibHxqMANRUdhAxPyMxYPStY8=; b=YHlSravXawEAmb/ZIB/vmSdFw
	gUPDbPRCzA18CYvn8J1q8hNoiATpRUc4zcnAXnrhn3NqbeRaPwcAVUs603cDPmE1FRk0zq1QQHrZs
	e/xQzdNFup0PoQ/LGc1Yf2WADsbOiP2/s2as/g0Nsm3ne+d0zwS6JqIbSVEpJDqWSqS72O4jKOkPX
	EFaUJdfZGezfofW2mP731MXjzj3UOQ0svMckYjvApN/wECncM00v4z+L4Cj1iuZO5QKQGXZUavpJw
	zxfiQALNqeZx9DTuY3OGxRNyHMW9b05HhK+9pO3ra7bizfavwW18lNzpvzjcTIZgrmJZr9K+EWByQ
	0IWEJAqzw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l8NOe-0001lU-4c; Sat, 06 Feb 2021 13:13:08 +0000
Received: from mail-wm1-f52.google.com ([209.85.128.52])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l8NOZ-0001kd-Qp
 for linux-arm-kernel@lists.infradead.org; Sat, 06 Feb 2021 13:13:04 +0000
Received: by mail-wm1-f52.google.com with SMTP id t142so6106872wmt.1
 for <linux-arm-kernel@lists.infradead.org>;
 Sat, 06 Feb 2021 05:13:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TcWqlo7340ClwaNrU2G13HH3PdkJ5tma+WdPpB6m4uk=;
 b=M9P/u/wkwQSiBupmJHMI107qLyKJCxO79EMTT1UIXfZCDFakxUKvPW9NsWHIqcY//O
 1ZrmaMlyXJvjduunQ0M/pr1tBhAwGpo0An8E37oyKdQ+fs4+wfx1/Nssc0pJZ+NebAKZ
 ZEpHngWSwcysHke9hFCsKZaVWSn+9TlIYjbhfZ2f6MIlK28/KWLkeUEAqFnztc2bsTj2
 TrEOpGeH+sJg2DLI+i85ODMyKSA7YcRKZEax4cn3QH6VGtfUaqPa6htr1SZtv5NjF33D
 NZBmstbTdkAI73Jd7LZRG8P6PHB5r+wNlgdNnVb2zNBU0MlfO+LP10A7ad8BruYznIF1
 s09A==
X-Gm-Message-State: AOAM531LLeEHZOZI5FoXR//VpVDGfM1HE0TKFg1QWFZQg4PnnZT6bOvw
 c9pY6x30iTgA663AmiIUYgVKB2+ce5g=
X-Google-Smtp-Source: ABdhPJxmmMbmWj5ntspZOudiviLyA/AkKCV1/oa2n4cSkwvyp024Ie1So4/dPvxLTHW2DQ2K5hFNrQ==
X-Received: by 2002:a1c:a707:: with SMTP id q7mr7476875wme.15.1612617182491;
 Sat, 06 Feb 2021 05:13:02 -0800 (PST)
Received: from kozik-lap (194-95-143-94.dyn.cable.fcom.ch. [94.143.95.194])
 by smtp.googlemail.com with ESMTPSA id 67sm11724509wmz.46.2021.02.06.05.13.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Feb 2021 05:13:01 -0800 (PST)
Date: Sat, 6 Feb 2021 14:12:58 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] ARM: s3c: fix fiq for clang IAS
Message-ID: <20210206131258.du6tmx7lda35rg5l@kozik-lap>
References: <20210204162416.3030114-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210204162416.3030114-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210206_081303_885797_B86878B9 
X-CRM114-Status: GOOD (  15.55  )
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
List-Id: <soc.lore.kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Russell King <linux@armlinux.org.uk>, Stefan Agner <stefan@agner.ch>,
 linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
 clang-built-linux@googlegroups.com, soc@kernel.org,
 Ben Dooks <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210206131258.pC6x2dHw-ul62Kvm9eMUHcLXWGgoj1oWjLcnApvwGi8@z>

On Thu, Feb 04, 2021 at 05:23:42PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Building with the clang integrated assembler produces a couple of
> errors for the s3c24xx fiq support:
> 
> arch/arm/mach-s3c/irq-s3c24xx-fiq.S:52:2: error: instruction 'subne' can not set flags, but 's' suffix specified
>  subnes pc, lr, #4 @@ return, still have work to do
>  ^
> arch/arm/mach-s3c/irq-s3c24xx-fiq.S:64:1: error: invalid symbol redefinition
> s3c24xx_spi_fiq_txrx:
> ^
> arch/arm/mach-s3c/irq-s3c24xx-fiq.S:79:2: error: instruction 'subne' can not set flags, but 's' suffix specified
>  subnes pc, lr, #4 @@ return, still have work to do
>  ^
> arch/arm/mach-s3c/irq-s3c24xx-fiq.S:104:2: error: instruction 'subne' can not set flags, but 's' suffix specified
>  subnes pc, lr, #4 @@ return, still have work to do
> 
> There are apparently two problems: one with extraneous or duplicate
> labels, and one with old-style opcode mnemonics. Stefan Agner has
> previously fixed other problems like this, but missed this particular
> file.
> 
> Fixes: bec0806cfec6 ("spi_s3c24xx: add FIQ pseudo-DMA support")
> Cc: Stefan Agner <stefan@agner.ch>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/mach-s3c/irq-s3c24xx-fiq.S | 9 +++------

Thanks, applied.

Best regards,
Krzysztof


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
