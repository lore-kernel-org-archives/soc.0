Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E132FC433EF
	for <soc@archiver.kernel.org>; Tue,  8 Feb 2022 11:14:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9A1D1C340F4; Tue,  8 Feb 2022 11:14:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83F07C340E9;
	Tue,  8 Feb 2022 11:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644318883;
	bh=r6PcY8Tt5CoLxJSt0ODJT7atCO62QPJzpudxUkSrULc=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=gNtJ0ambLwujKIX6fsH7y+COOyJffAvqh3SK8mXjgteZX6V0gjRtClVZJVO0E20U3
	 bGuiEvRTPw4XYVY5rOGherHGgLNGILU+Gvm0qEEUzwKgBy4pB/CY+KIvmXRlMhQFGU
	 ilM8xPimlZ+txXSS9Byl/bxaHoAtXl31FhuuD1PwSyKDZX2r15tzLPk1iXG/pxUsNW
	 pJuqNn+gK0WIO3kN/0tzyji31Ur8r3qPSbuHOGR7efJ9cmoFRNoyyMHoTTL+HN6sey
	 pnrqOFo/PFRfQPY1vyIxPWAHd16pTsr/f0EZMuQtDSkpwJezqIdAvlNE8v145xl4iu
	 SucqnQ5gKDlHA==
Received: by mail-wm1-f50.google.com with SMTP id q198-20020a1ca7cf000000b0037bb52545c6so1090376wme.1;
        Tue, 08 Feb 2022 03:14:43 -0800 (PST)
X-Gm-Message-State: AOAM531EQUC+Crifvv8UrtQXLZB1DzsnEIMMcs8J7hw5cfv2ATvEl+nD
	DysDCaNwAp3HNKKkfOHxU1RwSwJqtd2P8pbb+Zc=
X-Google-Smtp-Source: ABdhPJxGNn5mcwuFEgqid+gCsLC7sSzRLqL+edgxC9bi7kvsX4183Pwu5APwnEeCj0TfLVSxvO+RYuIGMr/MgnyGTeE=
X-Received: by 2002:a7b:cf18:: with SMTP id l24mr677072wmg.35.1644318881760;
 Tue, 08 Feb 2022 03:14:41 -0800 (PST)
MIME-Version: 1.0
References: <20211222141342.56395-1-sudeep.holla@arm.com> <20220107113740.f4zlz25largdjcfd@bogus>
 <20220108202410.GA1057@lx2k> <CAK8P3a1qcZHFpxdqF1AFSCGR+AyDrYmucdBQGz5G1PvnEMbp8Q@mail.gmail.com>
 <20220208103327.hjld33z3lkfrpu6k@bogus>
In-Reply-To: <20220208103327.hjld33z3lkfrpu6k@bogus>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 8 Feb 2022 12:14:25 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1Xq0O83PF1U-CcQTzAdaLuuxoLN=p+nC-ZjEbzAjPwSA@mail.gmail.com>
Message-ID: <CAK8P3a1Xq0O83PF1U-CcQTzAdaLuuxoLN=p+nC-ZjEbzAjPwSA@mail.gmail.com>
Subject: Re: [GIT PULL] firmware: arm_scmi: Updates for v5.17
To: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: Olof Johansson <olof@lixom.net>, ARM SoC Team <arm@kernel.org>, SoC Team <soc@kernel.org>, 
	ALKML <linux-arm-kernel@lists.infradead.org>, 
	Cristian Marussi <cristian.marussi@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 8, 2022 at 11:33 AM Sudeep Holla <sudeep.holla@arm.com> wrote:
> On Tue, Feb 08, 2022 at 11:00:43AM +0100, Arnd Bergmann wrote:
> > As the contents are still fine, I could offer to either merge the branch again
> > for v5.18, or I can drop it and wait for a new pull request from you, please
> > let me know your preference.
> >
>
> Is it OK if I merge this tag with v5.17-rc1 as base and load it with any
> new v5.18 material on the top ? I just want to avoid rebasing as the same time
> some of the new material depend on these changes. Let me know if that
> is fine. I am open to any other suggestions too.

Yes, I think that is ok, as long as you start a branch from v5.17-rc1 and merge
the old contents into the new branch, rather than back-merging the -rc1 tag
into your existing branch. This way, the git history still makes sense
across the
merges.

       Arnd
