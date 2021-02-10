Return-Path: <SRS0=mpRk=HM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D89DAC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Feb 2021 10:39:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B9B664E0B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Feb 2021 10:39:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B9B664E0B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TxEQcElbk8XmOEeNGh0iWwVjr0+hUo+TOUMAqn9Q+Zg=; b=RubVVY7q7HGC6lkemAxmuNnVn
	g9cvEqD8UoPxM6uKX3N7QVON1b3pi8Azok+QVp5SGsfKbIxALdwQV1rdvT4muDXhJInL3F7pkVoS9
	xIFvC2k85V8/FC2lGH+qFnuoYniElmfIbEoHqH5a5w/xA+AS2n1YHERgn8TMYNtwDmBaoAouPgvut
	dzoh2kkUfazWdvPPrqWEzbAPbC244RlUBYsiLerGLnXENsVm/9pzZ1bLFBPR31+5VfvA2kJr0/YfI
	AibVRzYDiicHGr2uxuNYhOdCS1pJyYvmw+w2YGgKdaM4NjRj550hvnOsEgsSzTF1tfUSFkRHOBD7Y
	IOOYn16yw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9mst-0006Ei-FW; Wed, 10 Feb 2021 10:38:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9msr-0006EH-3F
 for linux-arm-kernel@lists.infradead.org; Wed, 10 Feb 2021 10:38:10 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0B4E164E65
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 10 Feb 2021 10:38:08 +0000 (UTC)
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
Received: by mail-oi1-f174.google.com with SMTP id l3so1503654oii.2
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 10 Feb 2021 02:38:08 -0800 (PST)
X-Gm-Message-State: AOAM533taS6MUPSzkEByt60wS6FuswlKYRi95ACf8GZwAAHpheO2HDnU
 za+ceuG4zd6cggehwArJDwBMEUWe2/vwqv+4Cgg=
X-Google-Smtp-Source: ABdhPJxA9Kx3g91FSnt4s2DCj614mT+UHkeOW6LsxqLHSNEt+cQ0dS6n6u9RegDJMez08G5VyLFr54//U3mofZv7wt0=
X-Received: by 2002:aca:d908:: with SMTP id q8mr1523595oig.67.1612953486990;
 Wed, 10 Feb 2021 02:38:06 -0800 (PST)
MIME-Version: 1.0
References: <20210204052043.388621-1-bjorn.andersson@linaro.org>
 <161291108058.974605.13581246808545504549.b4-ty@arndb.de>
 <YCMaH1pYhU2VH8wp@builder.lan>
In-Reply-To: <YCMaH1pYhU2VH8wp@builder.lan>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 10 Feb 2021 11:37:50 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1q2pXXWJqxtHKbFQvYmp8cmrHz-dnUo8b+8C6jP6uffw@mail.gmail.com>
Message-ID: <CAK8P3a1q2pXXWJqxtHKbFQvYmp8cmrHz-dnUo8b+8C6jP6uffw@mail.gmail.com>
Subject: Re: [GIT PULL] Qualcomm ARM64 DT updates for 5.12
To: Bjorn Andersson <bjorn.andersson@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_053809_295609_60F3E9CC 
X-CRM114-Status: GOOD (  24.70  )
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
Cc: Eric Biggers <ebiggers@google.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, Steev Klimaszewski <steev@kali.org>,
 Caleb Connolly <caleb@connolly.tech>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Matthias Kaehlcke <mka@chromium.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Danny Lin <danny@kdrag0n.dev>, arm-soc <arm@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Andy Gross <agross@kernel.org>,
 Gustave Monce <gustave.monce@outlook.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "J . R . Divya Antony" <d.antony.jr@gmail.com>,
 Stephen Boyd <swboyd@chromium.org>, Olof Johansson <olof@lixom.net>,
 SoC Team <soc@kernel.org>, Jonathan Albrieux <jonathan.albrieux@gmail.com>,
 Vincent Knecht <vincent.knecht@mailoo.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Stephan Gerhold <stephan@gerhold.net>,
 Douglas Anderson <dianders@chromium.org>, Robert Foss <robert.foss@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210210103750.ZnZkSOtoTZfI9EvEdUW1eeexlUk891ElcmhbfltL2Jc@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
