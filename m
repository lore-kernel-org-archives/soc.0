Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 626EBC433DB
	for <soc@archiver.kernel.org>; Wed, 10 Feb 2021 10:38:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1240D64E62; Wed, 10 Feb 2021 10:38:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DC50464E4B;
	Wed, 10 Feb 2021 10:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612953488;
	bh=kJ5NEd1wPuralnoeS7NUAvqrMwfVJAwMjNF2FJererc=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=pBTyWSHupyiUZFMQo2CZyfAOBxgyUkgDxDPBqQt4s25RdJO4rpKQgoN3MmaK9ymoZ
	 Yjt/xmgHbQ1d4E1XWD5/NTA59MjfdUNsxqBF4VftfIkPwxMQ5ljlmEDlw42lwrtCYx
	 ZBfRcO3I2cm2NyLdI4G+p4oWQlbYYiTrretVgY94e+U1jgg11I5kvUEm4K3KrfUm49
	 zG+Iq6XubDL4CiGyWUtiQRYao+2NSXjeyd1AikGYm4HW6TbgonMcR+jWqjJLbS8Rit
	 Df0dvDq3p1a+N6C9mwykgrmpyf4n6Z/u97GFuNTRvSt8XlbtkPl58xly1B4ETrzNan
	 CRS09Io4cJj5w==
Received: by mail-oi1-f180.google.com with SMTP id i3so1504860oif.1;
        Wed, 10 Feb 2021 02:38:07 -0800 (PST)
X-Gm-Message-State: AOAM533uoHmmYoRBundQNjH9nL27/a+9odR7HhtIFm/33ob02d9U9TeO
	C1XaNE+gCglnEEvmotm77uSlNp3JoTi0b5CGNn0=
X-Google-Smtp-Source: ABdhPJxA9Kx3g91FSnt4s2DCj614mT+UHkeOW6LsxqLHSNEt+cQ0dS6n6u9RegDJMez08G5VyLFr54//U3mofZv7wt0=
X-Received: by 2002:aca:d908:: with SMTP id q8mr1523595oig.67.1612953486990;
 Wed, 10 Feb 2021 02:38:06 -0800 (PST)
MIME-Version: 1.0
References: <20210204052043.388621-1-bjorn.andersson@linaro.org>
 <161291108058.974605.13581246808545504549.b4-ty@arndb.de> <YCMaH1pYhU2VH8wp@builder.lan>
In-Reply-To: <YCMaH1pYhU2VH8wp@builder.lan>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 10 Feb 2021 11:37:50 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1q2pXXWJqxtHKbFQvYmp8cmrHz-dnUo8b+8C6jP6uffw@mail.gmail.com>
Message-ID: <CAK8P3a1q2pXXWJqxtHKbFQvYmp8cmrHz-dnUo8b+8C6jP6uffw@mail.gmail.com>
Subject: Re: [GIT PULL] Qualcomm ARM64 DT updates for 5.12
To: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Andy Gross <agross@kernel.org>, Robert Foss <robert.foss@linaro.org>, 
	Olof Johansson <olof@lixom.net>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
	Gustave Monce <gustave.monce@outlook.com>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Vincent Knecht <vincent.knecht@mailoo.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Akhil P Oommen <akhilpo@codeaurora.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Danny Lin <danny@kdrag0n.dev>, "J . R . Divya Antony" <d.antony.jr@gmail.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>, Matthias Kaehlcke <mka@chromium.org>, 
	Jonathan Albrieux <jonathan.albrieux@gmail.com>, Konrad Dybcio <konrad.dybcio@somainline.org>, 
	Steev Klimaszewski <steev@kali.org>, Stephan Gerhold <stephan@gerhold.net>, Vinod Koul <vkoul@kernel.org>, 
	Douglas Anderson <dianders@chromium.org>, Eric Biggers <ebiggers@google.com>, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>, 
	Caleb Connolly <caleb@connolly.tech>
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 10, 2021 at 12:26 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
> On Tue 09 Feb 17:06 CST 2021, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > On Wed, 3 Feb 2021 23:20:43 -0600, Bjorn Andersson wrote:
> > > The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> > >
> > >   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> > >
> > > are available in the Git repository at:
> > >
> > >   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-5.12
> > >
> > > [...]
> >
> > Merged into arm/dt, thanks!
> >
> > I noticed that this came fairly late in the cycle and has a fairly
> > large amount of changes in it. It would be nice if you could try
> > to send some of the DT contents a little earlier in the future to
> > avoid risking them to miss out.
> >
>
> Yeah, sorry about it showing up late.
>
> I'm trying to balance it because I do feel frustration from the
> contributors that the Qualcomm branches are "locked down" for 4-5 weeks
> per cycle.
>
> > It could also help to split up the largest branches to make them a
> > little smaller, e.g. by having one branch just for new SoC and/or
> > new board support, and another branch for changes to existing machines.
> >
>
> It's fairly common that things such as PMICs are reused between new and
> old platforms, so I fear that such a split will cause unnecessary
> conflicts between my trees.
>
> Perhaps I should just send multiple pull requests throughout the cycle?

That's what most others do that have a lot of contents, that definitely
works for me. Just use whichever way works best for your workflow.

If you have the usual ~200 changesets for a merge window, it would be
great to have the majority of those some time between rc3 and rc5,
with anything that you are not comfortable with committing early
in one of the later pull requests.

I don't mind getting a last-minute fixup or revert of an earlier change
when you have sent something earlier that looked good but it turned
out to be incorrect during testing.

        Arnd
