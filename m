Return-Path: <SRS0=1rdH=JD=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27942C433B4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Apr 2021 16:17:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA03A613C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Apr 2021 16:17:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA03A613C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=k7CjIczov3rj9PMIpQ6y1Ejv9HOZnxCn7WxkaGwuu3w=; b=BMjfsX1oLTJmjrHn1Gz5JbBYk
	9Ijh0f+E89asSNxW4Qfcd2uLaveowUbNxDOO3esGOmPeZCD2CJQytauIG2Npg45aHK6afMoXgCXdw
	13iACXwvRETtSAcDbmaoKhQA0JMA9AogrIKJIzagKlgOnnFmwhlyUmNdW2gA7qQ18QqjbL3bLrgeV
	wmOcZJYHpZx/n/7ih+MIhrTN15xa3MMb5oieeefWufp2eDyXYxX1IDMXBMiMPx9z9sd21YSZ2nWTP
	7pKnCVt2hAd6BPSNdg6ErP/oAraGcEZUooxN7hwBgKrCRGT3IHAGmXU/uDHCjq+1vvxnlIebfM0FZ
	oj319gJMA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lToMU-002z9v-5D; Tue, 06 Apr 2021 16:15:30 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lToMP-002z9I-Pu
 for linux-arm-kernel@lists.infradead.org; Tue, 06 Apr 2021 16:15:27 +0000
Received: from mail-ed1-f72.google.com ([209.85.208.72])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lToMO-0005ka-Hj
 for linux-arm-kernel@lists.infradead.org; Tue, 06 Apr 2021 16:15:24 +0000
Received: by mail-ed1-f72.google.com with SMTP id o24so10643059edt.15
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 06 Apr 2021 09:15:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Pc7Mc2iBHF1g8Xf3WZmYYKPrF2SwmZQ5FMyrEN7WVwU=;
 b=lK5k0Zsl6VYWdz+csAlSsnu/BwQtOxhU/PSCtqvqBHQIGnIJ5TXmsn1aVdumyHCKKk
 1Aex0X8YREE+YS2de8v7cSJTpVrzoQ27hvHgkksGkcDKYfhO7NNhx26IWm6YNDlnFjGV
 mHUVwAqIfSr30Ntu/aghoCaia6WiAtfn/94fywSJqEAk3UZz/pKIpD7OWW/sp4aTrOjf
 AQozj/6OaqYlIkfg7s5gaGqMgiMSsdB2R2DoYvvUXOFYb4d4g1oDYPIZdBoEdQYwqxeL
 /1PTP3tI0t2x4DOtY7/vy1WeLqkYWm55Ts9rV3MyKv9hyAwnUuBLmtawHWEzXx6G/UZu
 F9Zw==
X-Gm-Message-State: AOAM530FgRPvrOUAxe9w60X/mniubecIX/A+PJ4j/1HuWdA7erOXA/Ap
 qkruRoeZyeMcufh066/ABjva4cSW76+NlOKWyDbE7FrzCNKGiMoIr65q2XlFl1nPJ+dhHwSFNcH
 znC87SJuy5MZWgJEu0YYbPRbm4/Ly1PU59neTTv+RNKfVjrT0d5Qmu804OY18cLaHjBna
X-Received: by 2002:a17:906:ff15:: with SMTP id
 zn21mr20674052ejb.296.1617725724098; 
 Tue, 06 Apr 2021 09:15:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw804Texr+Avxb2Xtww4+jktrq8ZbSClHDrPU8KBZum7liZCTe94GVIXgCnwrVcGVlgqfayCTK8SXCiOhy7+HI=
X-Received: by 2002:a17:906:ff15:: with SMTP id
 zn21mr20674031ejb.296.1617725723902; 
 Tue, 06 Apr 2021 09:15:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210311152545.1317581-1-krzysztof.kozlowski@canonical.com>
 <20210311152545.1317581-9-krzysztof.kozlowski@canonical.com>
 <20210406160959.GA208060@roeck-us.net>
In-Reply-To: <20210406160959.GA208060@roeck-us.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Date: Tue, 6 Apr 2021 18:15:13 +0200
Message-ID: <CA+Eumj6C60r4DF24W2GobwB1GrQADLpm5YXLAzHjcjWmrrsE3g@mail.gmail.com>
Subject: Re: [PATCH v3 08/15] arm64: socfpga: merge Agilex and N5X into
 ARCH_INTEL_SOCFPGA
To: Guenter Roeck <linux@roeck-us.net>
List-Id: <soc.lore.kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, 
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>, 
 Dinh Nguyen <dinguyen@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Borislav Petkov <bp@alien8.de>, 
 Tony Luck <tony.luck@intel.com>, James Morse <james.morse@arm.com>, 
 Robert Richter <rric@kernel.org>, Moritz Fischer <mdf@kernel.org>,
 Tom Rix <trix@redhat.com>, 
 Lee Jones <lee.jones@linaro.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Alexandre Torgue <alexandre.torgue@st.com>, Jose Abreu <joabreu@synopsys.com>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-edac@vger.kernel.org, linux-fpga@vger.kernel.org, 
 linux-i2c@vger.kernel.org, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_171525_932814_45E5EEF8 
X-CRM114-Status: GOOD (  26.83  )
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
Message-ID: <20210406161513.UaOgmH2UhF6UKQaNWilhBSVhfD0EwRus3xyZjiLwtd8@z>

On Tue, 6 Apr 2021 at 18:10, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Thu, Mar 11, 2021 at 04:25:38PM +0100, Krzysztof Kozlowski wrote:
> > Agilex, N5X and Stratix 10 share all quite similar arm64 hard cores and
> > SoC-part.  Up to a point that N5X uses the same DTSI as Agilex.  From
> > the Linux kernel point of view these are flavors of the same
> > architecture so there is no need for three top-level arm64
> > architectures.  Simplify this by merging all three architectures into
> > ARCH_INTEL_SOCFPGA and dropping the other ARCH* arm64 Kconfig entries.
> >
> > The side effect is that the INTEL_STRATIX10_SERVICE will now be
> > available for both 32-bit and 64-bit Intel SoCFPGA, even though it is
> > used only for 64-bit.
>
> Did you try to compile, say, arm:allmodconfig with this patch applied ?
> Because for me that results in:
>
> In file included from <command-line>:
> drivers/firmware/stratix10-rsu.c: In function 'rsu_status_callback':
> include/linux/compiler_types.h:320:38: error:
>         call to '__compiletime_assert_177' declared with attribute error:
>         FIELD_GET: type of reg too small for mask
>
> and lots of similar errors.

Thanks for the report. I fixed that already with:
https://lore.kernel.org/lkml/20210321184650.10926-1-krzysztof.kozlowski@canonical.com/
(and https://lore.kernel.org/lkml/20210404124609.122377-1-dinguyen@kernel.org/ )
but for some reason it did not go to the same tree.

Best regards,
Krzysztof

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
