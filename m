Return-Path: <SRS0=WGdq=M2=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAEDBC4338F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Aug 2021 12:41:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA5C460184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Aug 2021 12:41:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BA5C460184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YMZLt1CLK0vLI5EC/WUnezRKO8YQxXS5Z7D4ur1AWGk=; b=SRxSTqAV4ma9Td
	r4JYVqX3abMKXVw0NcwtDScJLWFUbM9JH2IiqkRlybq9pS8/QVOtNcISSTSjTn2U8cwZbOKowpucr
	hdWlWgfnHZJHIBWhHvGoH9JcoypDbk24yJqfdwn1zhnT+cM4Cp6spEJFVRkm/T7pApvBYSG66Ysuw
	wy/XL8nESfQw4fONRClfHL2bTYZOfMVFDt5bHkYJ2BoyKqX2FmlL9jWrY9Lsth9kmsMZ3PJPIYMFd
	bFBYV9PVUsGHI1YoiY/BnJbvpYcrYc8al0ZOtNlqWlztXkSoevh6fiJbjSJSlHFaw/EMcQsD03tSQ
	so2bdEhF1yFKegEVSnRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAthF-002gmp-Ru; Tue, 03 Aug 2021 12:39:03 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAtHr-002YF6-Ho
 for linux-arm-kernel@lists.infradead.org; Tue, 03 Aug 2021 12:12:49 +0000
Received: by mail-lf1-x133.google.com with SMTP id z2so39411190lft.1
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 03 Aug 2021 05:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CjwFLstJrPnRmXg/rZRQYNcQZixdp2USEJZj3tF3f38=;
 b=QZvsRYa5PI0EjkNxpFJt0PjnkZl/KzLMkb06EW7T3tkTDAe4SGOPJhjWDkxfPWHvtP
 bXdVGwpVKHTCyVg74Io3kBqhbco3yndRvKndVVFP1tHO789dMj3mi3/UKGHCbUs+ZydN
 oqwUFqGcDgydpFFlJRoUTPa8ExjIjwY2nex7pkICvVHbSkG56SCi7BVTrYd1c5GPKxnu
 WYIuFov9/lUOjKg/fB7OpjVWR72yCX91lvbLkibrUvmaZovNuqrdFJE9FOkNSzdV86PG
 ffLRdFMBmEjJrK1qId5SfGLKqHKBDClc9krcDn3h9GL2lJhJ9kmrWkaIFG/sn/8eVOt3
 Qofg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CjwFLstJrPnRmXg/rZRQYNcQZixdp2USEJZj3tF3f38=;
 b=VBoMlcqqW2uWuVgyCa9qvJTBZaHj4ceod6da3Dy4NGqEk/NedV5TFAWnugcMv31g53
 S+OgcXaCmt5dRi7EOTgMzw9fY5s4EuD/EePgmZCnxvsTx0Q+JNg/BJqTZBMXToSTRy2U
 nI2YPft4GvBdQuEEY2fD5nDO0XPgspYXOt5vmMSj5oRc6HrPK+n6mmDJeNCwQClL1Zz+
 965Nrz7Fa2PFOjTGAlur6/4usX4DJQSGDQSshNgrsrNYcNWTTEDHAI/YsPwuOlZp2IWw
 dl4rKsqMH9tJ4YPLs6W5pS8yVAPKBXofew+Exr0gP9rAWXEB2S1RpyIAG78/PAzMDrll
 Zufg==
X-Gm-Message-State: AOAM530qokxnIuTwDEm0f6TEhyALGsCNBwvtwx1+3p5ePE84vKgucw82
 KAIVx9W0RfrZJIJTyIqTKMo5MYnEdzJYqN1Lz7R2Pg==
X-Google-Smtp-Source: ABdhPJz782mMUx2DQxPgWR7w25+Ro1pQSWnX/5zTyOK3W2u5RXz/AhlGd1Pib3weOa5vmkxj00IAN8QgYUu3dBYZqNw=
X-Received: by 2002:a05:6512:132a:: with SMTP id
 x42mr15849594lfu.291.1627992764702; 
 Tue, 03 Aug 2021 05:12:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210802141245.1146772-1-arnd@kernel.org>
 <CAL4-wQqCL1S-GYu7VKJeTT37wh=rR=SMUuwgKiXnnn_Y=uydOA@mail.gmail.com>
In-Reply-To: <CAL4-wQqCL1S-GYu7VKJeTT37wh=rR=SMUuwgKiXnnn_Y=uydOA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 3 Aug 2021 14:12:33 +0200
Message-ID: <CACRpkdbRbgjo1AkZVd0J1nhuo601o8=20rKR+ccaJR1+vqn6qg@mail.gmail.com>
Subject: Re: [PATCH] ARM: ep93xx: remove MaverickCrunch support
To: Martin Guy <martinwguy@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Hartley Sweeten <hsweeten@visionengravers.com>, 
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, SoC Team <soc@kernel.org>, 
 Nikita Shubin <nikita.shubin@maquefel.me>, Arnd Bergmann <arnd@arndb.de>, 
 Oleg Nesterov <oleg@redhat.com>, Hubert Feurstein <hubert.feurstein@contec.at>,
 Lukasz Majewski <lukma@denx.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 clang-built-linux <clang-built-linux@googlegroups.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_051247_678408_A83FA8BB 
X-CRM114-Status: GOOD (  15.16  )
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
Message-ID: <20210803121233.X3aOxk-EIh8GiytupetLWrVy0n-sNPBkKokZOprqOxE@z>

On Mon, Aug 2, 2021 at 5:45 PM Martin Guy <martinwguy@gmail.com> wrote:

> > was removed from gcc in its 4.8 release in 2012.
>
> I was sad about that, as I had managed to get it working correctly in
> 4.2 4.3 and 4.4.
> Unfortunately the GCC ARM maintainer at the time was paid by ARM, and
> they had no interest in it, as I gather the ARM-Cirrus partnership
> ended up disappointingly.

Political issues aside, have you considered contributing support
to LLVM instead?

It currently doesn't even support ARMv4 AFAIK but reportedly
has an easier to use and maintain back-end. (I do not know if
this is true, I just browsed this:
https://llvm.org/docs/WritingAnLLVMBackend.html )
Current ARM Targets are here:
https://github.com/llvm/llvm-project/tree/main/llvm/lib/Target/ARM
And they have a very clear and straight-forward developer policy:
https://llvm.org/docs/DeveloperPolicy.html

If ARMv4 support could be added to LLVM, that would solve
a lot of my headaches for ARM32, where we have things like
SA110 being actively maintained.

Yours,
Linus Walleij

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
