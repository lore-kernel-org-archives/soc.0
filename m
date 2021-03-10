Return-Path: <SRS0=6xFU=II=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69374C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Mar 2021 15:41:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0878864FB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Mar 2021 15:41:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0878864FB9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HQukK0H4uq1zMxbP/UoVK7fw/AUITxROPmJ8pYmwU/c=; b=JWkOyp4gGJ27zKxwv7No1zi1k
	3dS3SudY00J/zmuRIsMxU1N8hhi+liBIKTfOx+JvikfBatoBs981cqYh7PzNkoeqZCHMu3HuNkZNp
	/uf/La0RUyJzTLZ7YL368qRafJ/E2GgleKtmDLVxyeMAeNOAU8GZGZjKPnghLE2RE1GOhGFl+nT3Q
	RxvjvtLPelnD+FKlSY7p2GMDlZPm3sfwY/Ssyngbl2L4MhdjGFDDqYYLzNu+3Xekd6UvnVRJuR4At
	Vnp+s2wBQUZUPLwoN+yxaqtsw6YjT1IkBGxda6fTdPnbkOEa7f16hdnjW18XPMGj6FZ3Y5uXGrVlr
	9kXlhT+fQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lK0wN-0078Zz-El; Wed, 10 Mar 2021 15:40:03 +0000
Received: from mout.kundenserver.de ([212.227.126.134])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lK0wI-0078ZK-GV
 for linux-arm-kernel@lists.infradead.org; Wed, 10 Mar 2021 15:40:00 +0000
Received: from mail-ot1-f48.google.com ([209.85.210.48]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MYcy3-1lGMAh12EF-00VhcC for <linux-arm-kernel@lists.infradead.org>; Wed, 10
 Mar 2021 16:39:56 +0100
Received: by mail-ot1-f48.google.com with SMTP id f8so11721990otp.8
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 10 Mar 2021 07:39:55 -0800 (PST)
X-Gm-Message-State: AOAM531phZbb9AymyxyobhwlLGODyEwTXzLA8FYVUTdBg14adsAlLams
 057sev1p7mImfTZ0h/ZlvdQxaazNY7+VgIsxVUk=
X-Google-Smtp-Source: ABdhPJyz+OU7gvgIrSIrSop4e8azU44xAIwSKa5HpTc5C9P44C7QC3z/u5GcCJR7jvFrP3vF9cowRntGlUhuRjPALp4=
X-Received: by 2002:a05:6830:14c1:: with SMTP id
 t1mr2985547otq.305.1615390794792; 
 Wed, 10 Mar 2021 07:39:54 -0800 (PST)
MIME-Version: 1.0
References: <20210310083327.480837-1-krzysztof.kozlowski@canonical.com>
 <20210310083840.481615-1-krzysztof.kozlowski@canonical.com>
 <20210310094527.GA701493@dell>
 <35c39c81-08e4-24c8-f683-2fa7a7ea71de@redhat.com>
 <1c06cb74-f0b0-66e5-a594-ed1ee9bc876e@canonical.com>
In-Reply-To: <1c06cb74-f0b0-66e5-a594-ed1ee9bc876e@canonical.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 10 Mar 2021 16:39:37 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1CCQwbeH4KiUgif+-HdubVjjZBkMXimEjYkgeh4eJ7cg@mail.gmail.com>
Message-ID: <CAK8P3a1CCQwbeH4KiUgif+-HdubVjjZBkMXimEjYkgeh4eJ7cg@mail.gmail.com>
Subject: Re: [RFC v2 3/5] arm64: socfpga: rename ARCH_STRATIX10 to
 ARCH_SOCFPGA64
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
Cc: Tom Rix <trix@redhat.com>, Lee Jones <lee.jones@linaro.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Moritz Fischer <mdf@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 DTML <devicetree@vger.kernel.org>, 
 linux-clk <linux-clk@vger.kernel.org>, linux-edac@vger.kernel.org, 
 linux-fpga@vger.kernel.org, Networking <netdev@vger.kernel.org>, 
 linux-stm32@st-md-mailman.stormreply.com, arm-soc <arm@kernel.org>, 
 SoC Team <soc@kernel.org>, Olof Johansson <olof@lixom.net>
X-Provags-ID: V03:K1:uyU4B/53L6dBt9CzUeCrsB+FbCZ/yDqqaTcLFCtz039L76EV8NV
 5z2oG994B01K95/VO+TtB8gtR8mhFtlAR0AxQs4Cb9ri0wd5w1ySv9V5MMDPdyPZQe8uvas
 7S0LiY1O7dfFcN1XeBgrRRIvNSSeCyWcgc5igl+td/vlptBvg9uEW8oIGMJTxd5svTwkP0Z
 HuWE/RR9FknRbiAjGEZAw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/6/1A957YtU=:c2I9K3hfL+VTeFXAN6Wq6J
 DXgBNjbc2sCPXsiTLfG+iO5GnbUgIL8LJFMudzyh+47xC7U5smEqirTGNu8jtzwmbGaqMhaA+
 vGJUQR/kHk3owNOOhwSwgBN1T6RDye+AYJSCcAGNKFdJZSR5kIIgRSJGtaCwTSrYPIjq8RZIx
 zUANgMHUl8Tmx3yXYg3jjyVR5r1zGPyb2DaZFi96UBSf7Z5xu15MeYVl2s3jAbCjDRNC/oYbx
 YMikrIlnbNjdTOsMzppOOHcCVcu6Igu8/1Ebz9rFM1AbcjdyBwi4RuSDHZolAzysVPTU64wVN
 m1N5cHSz7xJEoCeSonUfnjUwqowEysUhnFrpcgiuBXWMu9vR0VqdYLUewbGN6ahvfM+9/jGEp
 TCN3YzqLBeU/estVgyP1qdiFghVSQgQ+A4+bP/ro938KFniS/1EwLj5+bvxi4FGu7yShw3A9X
 2JPUUd/H6o7UCnCHCzFt6uN2MMbBS0upVNPFQwjyv1s897eMQEX3XYDBGhirRJ2INgfm5kN4d
 7J0UWfZ/vZPvrhlpSLWiqkzQYo376SYSjtNTMfZlyOJ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_153958_642832_FC243A50 
X-CRM114-Status: GOOD (  17.61  )
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
Message-ID: <20210310153937.jrT1zfTjYoMGJz_hOt8KxORFAvB-T5Z7_mb-P28LUG4@z>

On Wed, Mar 10, 2021 at 4:06 PM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
> On 10/03/2021 15:45, Tom Rix wrote:
> > On 3/10/21 1:45 AM, Lee Jones wrote:
>
> Many other architectures do not have vendor prefix (TEGRA, EXYNOS,
> ZYNQMP etc). I would call it the same as in ARMv7 - ARCH_SOCFPGA - but
> the Altera EDAC driver depends on these symbols to be different.
> Anyway, I don't mind using something else for the name.

I agree the name SOCFPGA is confusing, since it is really a class of
device that is made by multiple manufacturers rather than a brand name,
but renaming that now would be equally confusing. If the Intel folks
could suggest a better name that describes all products in the platform
and is less ambiguous, we could rename it to that. I think ARCH_ALTERA
would make sense, but I don't know if that is a name that is getting
phased out. (We once renamed the Marvell Orion platform to ARCH_MVEBU,
but shortly afterwards, Marvell renamed their embedded business unit (EBU)
and the name has no longer made sense since).

Regardless of what name we end up with, I do think we should have the
same name for 32-bit and 64-bit and instead fix the edac driver to do
runtime detection based on the compatible string.

        Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
