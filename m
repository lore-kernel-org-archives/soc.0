Return-Path: <SRS0=WGdq=M2=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E89AFC4320A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Aug 2021 12:54:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDBE760FC2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Aug 2021 12:54:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BDBE760FC2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XUW7dw4NiiZD2hu7KhTi7jkd+7S7XF7UUJb/WVzRuDw=; b=GIb21GuJosdxNg
	TdBRdgAP98seggagUcSR66dz5jae37AuL6id7WxbZw9BS0lAWP375Hb5LSPNsAMT5ontRsfGgr+Xr
	s9QFdGiAGUxit2Ob9wIYWAnCV/5em8IBPWZH6RLQN99KHruyeq77Ms57xDntUHLo+gNaaDft6ZPzb
	xdCsfDqrEdPCgh0xIF6f5WmDwdEvL480yp+UkPNKXqGOXl2rrma7/ujZbPumR7nneezuhhKecKNnH
	4Ja6a5hxlhW4nczGYv0BrZKutkK+rm3ORkOPFWEQ+QoEYwK81LCDrqbzSqn0gTRQE7T9Cl2ye/74h
	HDdG/Rz4PCX6rTREONeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAtto-002lHe-QU; Tue, 03 Aug 2021 12:52:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAtXq-002dj6-Vt
 for linux-arm-kernel@lists.infradead.org; Tue, 03 Aug 2021 12:29:20 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8216760F56
 for <linux-arm-kernel@lists.infradead.org>;
 Tue,  3 Aug 2021 12:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627993758;
 bh=CdMdo7VqEhOqOW8v9CPwGDUDVowXGaioSYBwccf45xg=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=ULuqlMlpBwWgLW82sbAqhYSTr8asnxuhGKxrTy7bMZqSXIypT5wO9lLqDISIWVwCQ
 OAclj0t6cJvCu+6gmiUitxlIqetGBt9YbRJ52Pk86rHFUI34b03Uqj89cTPShxDgSH
 9439LijulHZymPKepafmhgW1XJ9hlY5sDg0ygxa6r+xOj2pUPqpPuc+/m7Eot2HQc9
 wgRlAod+2jt1avp5IHpypf4gHlVg9dye7Aiauv6MKqBEqvWUJCoSeEIepO02WtMty3
 ZrfJUa9iDnHlwheUz+Fk7xce0MODnNWbfon7mwBe3bJZ0kgy98+KGXjY5pxbBfc3KM
 XuMEaNH9pAPQg==
Received: by mail-wm1-f50.google.com with SMTP id
 l11-20020a7bcf0b0000b0290253545c2997so2017508wmg.4
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 03 Aug 2021 05:29:18 -0700 (PDT)
X-Gm-Message-State: AOAM532XCgV8WwWEKCq/zWXlkrDbkOD9+9KYb9cMwCWmj73PIfU/R6To
 sEyXfpONT30KYuXge7CGP6tNReyhXaF4nVH1oqg=
X-Google-Smtp-Source: ABdhPJyli+UFFruAa933Tm1+U1g/8oxWoQ+AO85gp2Zg5a2H1T9MUphx/Qm9fgrTO9M6+cdv/uHOEehAGahl3VCXD+I=
X-Received: by 2002:a1c:208e:: with SMTP id g136mr4091091wmg.142.1627993756987; 
 Tue, 03 Aug 2021 05:29:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210802141245.1146772-1-arnd@kernel.org>
 <CAL4-wQqCL1S-GYu7VKJeTT37wh=rR=SMUuwgKiXnnn_Y=uydOA@mail.gmail.com>
 <CACRpkdbRbgjo1AkZVd0J1nhuo601o8=20rKR+ccaJR1+vqn6qg@mail.gmail.com>
In-Reply-To: <CACRpkdbRbgjo1AkZVd0J1nhuo601o8=20rKR+ccaJR1+vqn6qg@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 3 Aug 2021 14:29:00 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0QTxd4ghTYz7kRWnxLrL8hBQ1PwNuR4ptLw-dOkKmPPg@mail.gmail.com>
Message-ID: <CAK8P3a0QTxd4ghTYz7kRWnxLrL8hBQ1PwNuR4ptLw-dOkKmPPg@mail.gmail.com>
Subject: Re: [PATCH] ARM: ep93xx: remove MaverickCrunch support
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Martin Guy <martinwguy@gmail.com>, Russell King <linux@armlinux.org.uk>, 
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
X-CRM114-CacheID: sfid-20210803_052919_121089_B35AAFBC 
X-CRM114-Status: GOOD (  23.80  )
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
Message-ID: <20210803122900.pChOzg1r19U-_40sRp9RuRPXTzFks3zp4VUXJ7rKVBw@z>

On Tue, Aug 3, 2021 at 2:12 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Mon, Aug 2, 2021 at 5:45 PM Martin Guy <martinwguy@gmail.com> wrote:
>
> > > was removed from gcc in its 4.8 release in 2012.
> >
> > I was sad about that, as I had managed to get it working correctly in
> > 4.2 4.3 and 4.4.
> > Unfortunately the GCC ARM maintainer at the time was paid by ARM, and
> > they had no interest in it, as I gather the ARM-Cirrus partnership
> > ended up disappointingly.
>
> Political issues aside, have you considered contributing support
> to LLVM instead?
>
> It currently doesn't even support ARMv4 AFAIK but reportedly
> has an easier to use and maintain back-end. (I do not know if
> this is true, I just browsed this:
> https://llvm.org/docs/WritingAnLLVMBackend.html )
> Current ARM Targets are here:
> https://github.com/llvm/llvm-project/tree/main/llvm/lib/Target/ARM
> And they have a very clear and straight-forward developer policy:
> https://llvm.org/docs/DeveloperPolicy.html
>
> If ARMv4 support could be added to LLVM, that would solve
> a lot of my headaches for ARM32, where we have things like
> SA110 being actively maintained.

I think for ARMv4 support, the only thing we need from llvm is
to have R_ARM_V4BX relocations, and for lld to support the
--fix-v4bx switch that turns 'bx' instructions into 'mov' when those
relocations are found. This is something that we have previously
discussed with the llvm developers and that may easily happen.

For the Crunch support, I don't think it's worth spending any effort
on adding that to llvm. If there are any remaining users, they have
probably stopped upgrading their user space long ago (to be
confirmed). The SoC itself has been "not recommended for new
design" since 2019, so we are unlikely to see new users of the platform
in the future, and I think existing users are equally unlikely to move
from softfp to crunch even if they have the option.

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
