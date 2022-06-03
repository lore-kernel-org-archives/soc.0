Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF299C433EF
	for <soc@archiver.kernel.org>; Fri,  3 Jun 2022 07:49:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7C93FC3411D; Fri,  3 Jun 2022 07:49:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 662CAC36AE9
	for <soc@kernel.org>; Fri,  3 Jun 2022 07:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654242569;
	bh=5VWEmk5P6MuYYd5myyeP1w398M8prhSzzvETfvT8tXo=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Cxf45UaTpNV+iGbPt7RptU7o1HHUzQg0PCdWs1IQjKClsKtTDEkMM0e1BPMob6MdG
	 ORMXqChqMJwlqhZlYb2KG6Jg/ROr85DiVAmNoSWTj8J0HCzX5Hwhch5tiNtbTkmxdH
	 fvuphhyICa7B+XQzMq+wGRQ3es/EmzWrbA0NjEVXLUqlUplvFI0g9frsDzlzPqANTh
	 nvtKS7GZMPLnRBjibrgVT7ZvCRwYmvDwtQpGPUPNHI8qkGFzZCjV+tOv4zJwBxhYyR
	 KS3cTWNzDCNdDOYU1kM0MORWZLHM4PnETtvsR6O4Iib848L7h2dcTY2TQNlIsnsLrr
	 ircgE22bbDbIw==
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-30c143c41e5so74411517b3.3
        for <soc@kernel.org>; Fri, 03 Jun 2022 00:49:29 -0700 (PDT)
X-Gm-Message-State: AOAM533OMOal8nymDSGk8EEHnyta6CrQuG89atZN4eONPE0lAwHfYv9E
	fBt5ySvCVbvG419db3CkOXDZkyWFz4lvCtrCB9s=
X-Google-Smtp-Source: ABdhPJyjFAGYlg0LX4rfJq7TlIRr3CKHV9eUzzvCBgviaQgqdUbACstpz9sjTmnfX9UqAxFPXs/wkH8xELN3rFztF9E=
X-Received: by 2002:a81:745:0:b0:30f:b172:9efb with SMTP id
 66-20020a810745000000b0030fb1729efbmr10225775ywh.495.1654242568416; Fri, 03
 Jun 2022 00:49:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a13uAiBJkqD9UMmnfFn3AAY2ZqQisVQdovRy5dKiyJaXQ@mail.gmail.com>
 <CAHk-=wjhJ1dUVVMkHOk88xsYJtqfyGZ_8hSGJoZG5K+uwUYT3A@mail.gmail.com>
In-Reply-To: <CAHk-=wjhJ1dUVVMkHOk88xsYJtqfyGZ_8hSGJoZG5K+uwUYT3A@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 3 Jun 2022 09:49:11 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0KY85oXykWqPwJFJ+yw1a=KmRvA0SYM1zioV6DW+76TQ@mail.gmail.com>
Message-ID: <CAK8P3a0KY85oXykWqPwJFJ+yw1a=KmRvA0SYM1zioV6DW+76TQ@mail.gmail.com>
Subject: Re: [GIT PULL 1/2] ARM: multiplatform changes, part 2
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	Daniel Mack <daniel@zonque.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 3, 2022 at 12:27 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Thu, Jun 2, 2022 at 2:34 PM Arnd Bergmann <arnd@kernel.org> wrote:
> >
> > The second part of the multiplatform changes now converts the
> > Intel/Marvell PXA platform along with the rest.
>
> I _think_ the conflicts were all trivial, but hey, since I can't
> really even build-test them, please do check the result out...

Yes, looks good to me. I really should have mentioned the bit about
'depends on CPU_LITTLE_ENDIAN', but I see you figured it out.

        Arnd
