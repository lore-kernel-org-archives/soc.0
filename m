Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A56EDC433DB
	for <soc@archiver.kernel.org>; Tue,  2 Feb 2021 16:41:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7B58E64F81; Tue,  2 Feb 2021 16:41:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 593FC64F64;
	Tue,  2 Feb 2021 16:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612284097;
	bh=yhXL5lBZvpF2lY2jMr9ZBBLiU54D+Ml9qp/8EyRk+mE=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=jzl1wsd2gqYOlJT+Uy1RaTe3yLACURgq3qw4986GrAkAd6rwMYHmkFHAvEQb4U68A
	 onTlND3uE/2wMCz6QTt9chvsw+btWV6QF2QjqnaXYERcRv7a/j+8ZZ8y3ePXUqtrv0
	 Rv045rLLKEbs7+7KxDknRF07LOQx4S/hUCfi2ltcoDp94X1zC0X8wj9XX8P7oXmGZ9
	 CH6Mb68sysZvyyTJN3zP52Vt9aYwKm4zYzT2ep8MW8OaHOEdKnhlYarrIWgNotHrYR
	 bvUuGiABY0Y+2dLRYTDzNjF4qhOiYsH7gmuDTjsNAB6b/dOudv61fovt4ueSa/dHjC
	 kRD+fKzgWMvug==
Received: by mail-ot1-f51.google.com with SMTP id t25so10312980otc.5;
        Tue, 02 Feb 2021 08:41:37 -0800 (PST)
X-Gm-Message-State: AOAM531nPbLkEUbiSETt+U4RZNMDPSmiOcsjIJopRi3VtQ/fIGLHN948
	ow6h2tJNpb9lMiiDQis9I8z0ZLFjcRCjUHCiwaM=
X-Google-Smtp-Source: ABdhPJwRzvrw+pQxuBBZPU2H5Ytm/UMABSLPz7RWZpTRPMlCn6D6IUrv96tJ6ZL8AmQilLy5hqNEd7ANHmMok1aCJqo=
X-Received: by 2002:a05:6830:1256:: with SMTP id s22mr2584901otp.251.1612284096674;
 Tue, 02 Feb 2021 08:41:36 -0800 (PST)
MIME-Version: 1.0
References: <20210121034130.1381872-1-lkundrak@v3.sk> <CAK8P3a2DYX3c-AMX9URSyrcQckY2UaRRTmnOwe=4q3P4cJ-t5A@mail.gmail.com>
In-Reply-To: <CAK8P3a2DYX3c-AMX9URSyrcQckY2UaRRTmnOwe=4q3P4cJ-t5A@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 2 Feb 2021 17:41:19 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2Ub0w3v_H_0F84MPdQZ28vUgxdYNii7eVY0o9a_sg7DQ@mail.gmail.com>
Message-ID: <CAK8P3a2Ub0w3v_H_0F84MPdQZ28vUgxdYNii7eVY0o9a_sg7DQ@mail.gmail.com>
Subject: Re: ARM: dts: mmp devicetree updates
To: Lubomir Rintel <lkundrak@v3.sk>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>, 
	SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	DTML <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 22, 2021 at 3:09 PM Arnd Bergmann <arnd@kernel.org> wrote:
> On Thu, Jan 21, 2021 at 4:41 AM Lubomir Rintel <lkundrak@v3.sk> wrote:
> >
> > chained to this message is a handful of patches related to MMP device
> > trees and bindings. Please take a look and consider queueing them for
> > for 5.12.
>
> These all look good to me, but I notice that a lot of them seem to be
> bugfixes, so please have another look and decide if any of them should
> go into v5.11 and perhaps backported to stable kernels as well.

Hi Lubomir,

not sure if you missed my earlier mail. To clarify, I have not applied
any of the patches so far. Can you recheck if some of them should be
part of the v5.11 release so I know which tree to apply them to?

       Arnd
