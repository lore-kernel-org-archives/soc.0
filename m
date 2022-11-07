Return-Path: <krzk@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B243C4332F
	for <soc@archiver.kernel.org>; Mon,  7 Nov 2022 17:51:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F2FF4C433C1; Mon,  7 Nov 2022 17:51:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D75EFC433D6;
	Mon,  7 Nov 2022 17:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667843511;
	bh=4UU7R5xt/AtOkizC3oO21TyvSGXzZpcNUYWl/Dq2IAU=;
	h=Date:Subject:To:List-Id:Cc:References:From:In-Reply-To:From;
	b=dleOm0uekrwWe4ql1vnB4tpwh2jViPLEixEbp24uuS5V/xmRdo14bF1if8+H1iJW5
	 WvNU4rucn5ZWi9F2DMDfLeVS6Qy+O+Mqa7kzAR+LIVEoqQtnh5hJTHjKlfiDJw9XeB
	 LQzXdGWCB2/I/a+rNqDES1zgPG3Gk2bt4cto+6XBiZqyL7w2cJBqeQVYekuE0b62W5
	 IbYpv6EEMETizVJTxaBZIJHpfTI4zjok5L4loXaiwISX0ZXUGAukWFnoEZ8EWDSdIA
	 swO1qyLKxVEQJKCcEoveI8YMuFkyitmHo0v5A8AbmkbAcs+MlGGhXgJ+ON8REKWG5t
	 sIrpKHfqS2Ruw==
Message-ID: <882e75f9-dc96-4084-a64b-ace4246c88ff@kernel.org>
Date: Mon, 7 Nov 2022 18:51:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Should we merge arch/riscv/boot/dts via the SOC tree?
To: Palmer Dabbelt <palmer@dabbelt.com>, Arnd Bergmann <arnd@arndb.de>,
 Conor Dooley <conor@kernel.org>, kernel@esmil.dk
List-Id: <soc.lore.kernel.org>
Cc: masahiroy@kernel.org, mkl@pengutronix.de, davem@davemloft.net,
 linux-riscv@lists.infradead.org, soc@kernel.org
References: <mhng-e4210f56-fcc3-4db8-abdb-d43b3ebe695d@palmer-ri-x1c9a>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <mhng-e4210f56-fcc3-4db8-abdb-d43b3ebe695d@palmer-ri-x1c9a>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/11/2022 17:46, Palmer Dabbelt wrote:
> This has come up a bunch of times, but I don't think we've ever really
> made a decision.  Historically that's not been such a big deal because
> the RISC-V device trees were pretty inactive, but that's changed -- both
> because Conor has been cleaning everything up, and also because there's
> a bunch of SOCs showing up with RISC-V cores in them.  We talked about
> this again at plumbers a few times, but Arnd wasn't around it person so
> I figured it's best to just start an email thread and see how people
> feel.
> 
> A lot of these new SOCs are based on Arm designs and the device trees
> very much reflect that, so it makes sense to me to just keep the device
> tree merges via as similar a path as possible.  

Recent Renesas r9a07g043 (sharing between arm64 and riscv) is example of
that. If changes to them start coming via different trees, we might have
a lot of conflicts.

> IIUC that happens via
> the SOC tree these days, so it makes sense to me that we start handling
> the RISC-V device trees that way as well.  That would make things easier
> for contributors, as they'll have one workflow for all their SOCs, but
> also easier for me as a lot of this SOC stuff touches bits I really
> don't understand and thus get kind of lost trying to review.
> 
> Arnd: looks like you're handling most of the merges these days so this
> would be increasing your workload.  I feel kind of bad just dumping a
> bunch of stuff on you, but I think at least now the RISC-V DTS are in
> reasonable shape so hopefully it's not that bad.  It'd certainly help
> things on my end, and I'm happy to try and re-direct some of that saved
> time to helping out in SOC land but I'm not sure how well that'd work
> out in practice as I'm pretty buried.
> 
> On a somewhat related note, Conor has offered to pick up the otherwise
> unmaintained RISC-V SOCs.  That's sort of its own discussion, but if we
> change over to the SOC tree we might as well just do everything at the
> same time.
> 

On the other hand MIPS DTS is not coming via SoC tree, so there is no
yet such wide approach.

Best regards,
Krzysztof

