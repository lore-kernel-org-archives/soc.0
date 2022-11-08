Return-Path: <SRS0=1mNS=3I=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C616C4332F
	for <soc@archiver.kernel.org>; Tue,  8 Nov 2022 12:52:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 58DF7C433B5; Tue,  8 Nov 2022 12:52:01 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AC73AC433D7;
	Tue,  8 Nov 2022 12:51:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AC73AC433D7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id ACA975C00CD;
	Tue,  8 Nov 2022 07:51:58 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Tue, 08 Nov 2022 07:51:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1667911918; x=1667998318; bh=sHZw9c0S7+
	040MEW27mcXzSOhH0nluqzkCZq3pEorpM=; b=RANKIYPKCPOmGyaXcbIv9vT1vu
	r1J3fbfci0+lnkg/1DZxe6HveVhRNGLuhtB0UKIGhfR757U2HKcodz44xfUSTPSs
	9oqNQu6P1emZPI/DH9uUGKilRomtGb8LX4EopH7oz1Cw6uqx2ZuApe9b4fG1OpIe
	kGaksJmtdDdlKCq6kpWRyIETmRskAmrfu40WMHrdJbUJ3f45ZEdEkLB0ammM9v7+
	RL1XR/eCdPeHwa4dKJber24i9NMaPv0Hd4pH5SvVvCoxHdGwEfQnANKBwp8l0Yvz
	oVfW9clgUvj6V9ISrypz6vNsgYT3sxUHJPf+muGS9ED1xpKiwXIp7h7rr30w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1667911918; x=1667998318; bh=sHZw9c0S7+040MEW27mcXzSOhH0n
	luqzkCZq3pEorpM=; b=iJ0ytTxJBjYKlHSXsFV67916Fy29XrL56ggpf6egQXhQ
	rkr1BYnNVFvytpogiGyj2lBD1Ie1LpZg2Ow7OYkITNPwipcD9aI/H6m+U021N4hE
	Mtq8x+lXJnm9HzmY4VXeL4J0rkXUpruWckcYmAE5rE3spm35RRyXBZiV4YOWAVQa
	iSZC7ikdfywBdyOOd3A79wGFyakZUxOjkU+dihaz6d5jQtlL73Cf5iHkzjHyH/wN
	qhq5+1aNwM2mhplHw/DEhhsljV4CBiX8AwXanaYEXhcy8p6UH9tjPdKj1KvNKPTg
	mvLPnAjqWR/6OYSl90W/a9g+wQrX5kf00J3YAlPSuw==
X-ME-Sender: <xms:7lBqY3cUYhpkMA5t5ri_BRxc0SAVO5gWlMroGFKj0EtIJZQ1rlr2NQ>
    <xme:7lBqY9O8z7Ef5t8xPMlCWOUWyk1PcwKi_RkRH1uAZrUCf9yrLyI8GoM5d1FKGtEb_
    O_Ew8BEKZDKQ37o2VQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfedtgdegiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeevhfffledtgeehfeffhfdtgedvheejtdfgkeeuvefgudffteettdekkeeufeeh
    udenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:7lBqYwhQ_VxZTcFCnALrsYJ0pkGI0eW6Kl8PJ212JX0IqVE6hodyyQ>
    <xmx:7lBqY4-vBSqxDgV5hZH0rlsk9iZz3slzT_GFtdTDsaNemtqCrg5Org>
    <xmx:7lBqYzv-PRasWPeT_xiomELWV2SFhQmYj_5lFlR20VK1fKO5MQs3GA>
    <xmx:7lBqY3iFaQgHHBOWzC_OY3sYqtpJfv2MZUuKSNr25Rre-Zqqj66kaQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 1075BB60086; Tue,  8 Nov 2022 07:51:57 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1115-g8b801eadce-fm-20221102.001-g8b801ead
Mime-Version: 1.0
Message-Id: <f98d5faf-dd4e-46c0-ba55-9438615b434f@app.fastmail.com>
In-Reply-To: <Y2lPHzaHvpWjEoll@spud>
References: <mhng-e4210f56-fcc3-4db8-abdb-d43b3ebe695d@palmer-ri-x1c9a>
 <Y2lPHzaHvpWjEoll@spud>
Date: Tue, 08 Nov 2022 13:51:37 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Conor Dooley" <conor@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>
List-Id: <soc.lore.kernel.org>
Cc: kernel@esmil.dk, "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Masahiro Yamada" <masahiroy@kernel.org>,
 "Marc Kleine-Budde" <mkl@pengutronix.de>,
 "David S . Miller" <davem@davemloft.net>, linux-riscv@lists.infradead.org,
 soc@kernel.org
Subject: Re: Should we merge arch/riscv/boot/dts via the SOC tree?
Content-Type: text/plain

On Mon, Nov 7, 2022, at 19:31, Conor Dooley wrote:
> On Mon, Nov 07, 2022 at 08:46:00AM -0800, Palmer Dabbelt wrote:
>> This has come up a bunch of times, but I don't think we've ever really
>> made a decision.  Historically that's not been such a big deal because
>> the RISC-V device trees were pretty inactive, but that's changed -- both
>> because Conor has been cleaning everything up, and also because there's
>> a bunch of SOCs showing up with RISC-V cores in them.  We talked about
>> this again at plumbers a few times, but Arnd wasn't around it person so
>> I figured it's best to just start an email thread and see how people
>> feel.
>> 
>> A lot of these new SOCs are based on Arm designs and the device trees
>> very much reflect that, so it makes sense to me to just keep the device
>> tree merges via as similar a path as possible.  IIUC that happens via
>> the SOC tree these days, so it makes sense to me that we start handling
>> the RISC-V device trees that way as well.  That would make things easier
>> for contributors, as they'll have one workflow for all their SOCs, but
>> also easier for me as a lot of this SOC stuff touches bits I really
>> don't understand and thus get kind of lost trying to review.
>
> Reviewing the Renesas/Allwinner stuff, it's p apparent to me that they
> need to go via the same tree for RISC-V and ARM.
>
>> Arnd: looks like you're handling most of the merges these days so this
>> would be increasing your workload.  I feel kind of bad just dumping a
>> bunch of stuff on you, but I think at least now the RISC-V DTS are in
>> reasonable shape so hopefully it's not that bad.
>
> Warning free at least... :)

I don't see a problem with merging this through the SoC tree, it
was always the plan to pick up related changes across architectures
where needed.

The MIPS and PowerPC maintainers have so far preferred to handle
the changes through their respective trees, everything else
has been in the noise. Looking at the number of DT changesets since
linux-5.0 per architecture, I see

7748 arch/arm64/boot/dts
6654 arch/arm/boot/dts
197 arch/mips/boot/dts
155 arch/riscv/boot/dts
67 arch/powerpc/boot/dts
35 arch/arc/boot/dts
6 arch/openrisc/boot/dts
5 arch/xtensa/boot/dts
5 arch/nios2/boot/dts
5 arch/microblaze/boot/dts
2 arch/csky/boot/dts
1 arch/loongarch/boot/dts

>> On a somewhat related note, Conor has offered to pick up the otherwise
>> unmaintained RISC-V SOCs.  That's sort of its own discussion, but if we
>> change over to the SOC tree we might as well just do everything at the
>> same time.
>> 
>> Presumably we'd want to adjust the MAINTAINERS file in a handful of ways
>> to make sure patches end up in the right place.
>
> Arnd mentioned that that should cover stuff in drivers/{soc,firmware} as
> well as the dt, so with the assumption that that MAINTAINERS entry looks
> something like:
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cf0f18502372..03e78d2e5cc6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17709,6 +17709,16 @@ F:	arch/riscv/
>  N:	riscv
>  K:	riscv
> 
> +RISC-V/MISC SOC SUPPORT
> +M:	Conor Dooley <conor@kernel.org>
> +L:	linux-riscv@lists.infradead.org
> +S:	Maintained
> +Q:	https://patchwork.kernel.org/project/linux-riscv/list/
> +T:	git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
> +F:	arch/riscv/boot/dts/
> +F:	drivers/soc/microchip/
> +F:	drivers/soc/sifive/

I'd probably make separate entries here, at least for the
drivers/soc/microchip directory, I can see that being shared with
architectures other than RISC-V in the future, and the sifive
directory should probably have at least a reviewer from
sifive.com even if you plan to route the patches my way for
them.

    Ard
