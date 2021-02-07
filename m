Return-Path: <SRS0=h8h3=HJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3D9AC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Feb 2021 08:30:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36ADE64DC4
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Feb 2021 08:30:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36ADE64DC4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YCqMvzTPviRRuDOidZYt04+x+xg0LnU7WFdsg3hazqA=; b=gdglIM4Hz4A6X7jT8lfWL78ww
	GMnJ7e0W+R4hgqxAFZviPU4Q9ghn1Oms2wcbNknE6qiXxFLthfKglUehBf1YIVPRe5CfUPPqkBW/Z
	gj9CXpSqXENeEdeW1EIH+dUh7mPmQfuzF7ezVlEpADqkB05AyYDRs0KloYc1jIRg16g73mc4ekCdo
	GoMjvtoOB+fJpaU6dRj7aL/q4Wvg1HZtmFppXzsx7dLRPUfwWHgv/LfLR4tntIi1Ow/DA8MIaN713
	pDxsMZcV3kbxfrFZQxRtcp57yQTQ9OTaNkPv2NfVfjN/Hl0+XXUtt5sNLrZtG63Qmf4puiztmwejb
	wJ/b9YnHQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l8fQy-0000gQ-Tm; Sun, 07 Feb 2021 08:28:44 +0000
Received: from marcansoft.com ([212.63.210.85] helo=mail.marcansoft.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l8fQv-0000fW-89
 for linux-arm-kernel@lists.infradead.org; Sun, 07 Feb 2021 08:28:42 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: marcan@marcan.st)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 370D242856;
 Sun,  7 Feb 2021 08:28:36 +0000 (UTC)
To: Marc Zyngier <maz@kernel.org>
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-9-marcan@marcan.st> <87im75l2lp.wl-maz@kernel.org>
From: Hector Martin 'marcan' <marcan@marcan.st>
Subject: Re: [PATCH 08/18] arm64: cpufeature: Add a feature for FIQ support
Message-ID: <d110504f-2461-8b41-72cc-72681d775a97@marcan.st>
Date: Sun, 7 Feb 2021 17:28:35 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <87im75l2lp.wl-maz@kernel.org>
Content-Language: es-ES
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210207_032841_531082_9876C4F3 
X-CRM114-Status: GOOD (  25.00  )
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
Cc: Arnd Bergmann <arnd@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, soc@kernel.org, robh+dt@kernel.org,
 Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210207082835.hPcY8MUkXM_FTgeDEc70dDrV-duRoOaa6YKO3lJO4hg@z>

On 06/02/2021 22.58, Marc Zyngier wrote:
> Hector Martin <marcan@marcan.st> wrote:
>> +static void cpu_sync_irq_to_fiq(struct arm64_cpu_capabilities const *cap)
>> +{
>> +	u64 daif = read_sysreg(daif);
>> +
>> +	/*
>> +	 * By this point in the boot process IRQs are likely masked and FIOs
>> +	 * aren't, so we need to sync things to avoid spurious early FIQs.
>> +	 */
>> +
>> +	if (daif & PSR_I_BIT)
>> +		daif |= PSR_F_BIT;
>> +	else
>> +		daif &= ~PSR_F_BIT;
>> +
>> +	write_sysreg(daif, daif);
> 
> Could this happen too late? If, as explained above, we can get a FIQ
> until we mask it here, what prevents something (a timer?) from kicking
> and creating havoc just before the sync?

Nothing, other than timers not being enabled this early (hopefully the 
bootloader doesn't leave a rogue timer running for us...)

> If the answer is "nothing", then it probably means that the default
> behaviour should be to treat PSTATE.I and PSTATE.F as containing the
> same value at all times, and not just as an afterthought when we
> detect that we're on a CPU type or another.

I thought of this too. Originally I thought PSTATE.F was always set on 
other systems, and thus unmasking FIQs could cause problems if there is 
a pending rogue FIQ for some reason. However, while writing this patch I 
realized that as part of normal process state changes we already unmask 
FIQs anyway (see DAIF_PROCCTX).

Thus, in fact, this patch actually changes things (when the cpufeature 
is set) to mask FIQs in some cases where they currently aren't, and 
conversely to unmask them in some cases where they currently are. But 
the fact that FIQ masking is somewhat inconsistent to begin with 
suggests that we should be able to mess with it without causing breakage 
for other systems.

So I guess in this case it would be legitimate to just make I==F on 
every system, and if something breaks it should be fixed by making 
whatever is causing a rogue FIQ not do that, right?

That would leave the vector switcheroo as the only thing the cpufeature 
does, which would certainly simplify a lot of the patch.

> This could expand into enabling Group-0 interrupts with GICv3 on
> systems that have a single security state (such as virtual machines),
> though I don't really see a good use case for it.

I could see having a separate vector path opening up the door for 
performance hacks for very specific use cases that want really low 
latency for *one* thing (e.g. the mess the Raspberry Pi folks do to work 
around that braindead USB controller's performance issues), though I 
imagine there would have to be very compelling reasons to develop a 
framework to do this sanely upstream.

Incidentally, I have a personal interest in real-time performance 
(especially audio); once the dust settles and we have a workable kernel 
for normal use I do hope to spend some time taking a deep dive into 
latencies and finding RT-unfriendly code, but that's pretty far off 
right now. Maybe PREEMPT_RT will even be merged by then :-) (I hope that 
without SMM to screw things up on these machines they might make very 
nice RT-capable boxes...)

-- 
Hector Martin "marcan" (marcan@marcan.st)
Public Key: https://mrcn.st/pub

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
