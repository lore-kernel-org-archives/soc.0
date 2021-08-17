Return-Path: <SRS0=X35r=NI=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EDF5C4338F
	for <soc@archiver.kernel.org>; Tue, 17 Aug 2021 08:16:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0AC6761008; Tue, 17 Aug 2021 08:16:11 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48463604AC;
	Tue, 17 Aug 2021 08:16:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 48463604AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wm1-f45.google.com ([209.85.128.45]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MBUuP-1mMlMd3Enn-00D0ch; Tue, 17 Aug 2021 10:16:08 +0200
Received: by mail-wm1-f45.google.com with SMTP id w21-20020a7bc1150000b02902e69ba66ce6so1560546wmi.1;
        Tue, 17 Aug 2021 01:16:08 -0700 (PDT)
X-Gm-Message-State: AOAM533ybiydstfksO6cgrxzBO9PEQaBNruV+D/Hlxn0n52X4sctXjKY
	p6d5z2JEyWLmeu8anC1rNvQhwVk6sko2OT5ON5Y=
X-Google-Smtp-Source: ABdhPJzlr2DgXf+7LxALEnoTzhLxUSfXQkSzf2m61KgnQs42OE+o8NnnlZ/uvQYVbXlgb9n2lgVbC3mBF768k2rcJPY=
X-Received: by 2002:a1c:6a18:: with SMTP id f24mr2092620wmc.142.1629188168249;
 Tue, 17 Aug 2021 01:16:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210816231223.586597-1-bjorn.andersson@linaro.org>
 <CAD=FV=XHOOjVgoQsS7vMDzeov0p6groC6Qnxz_TWpFj7dh7XLQ@mail.gmail.com> <YRr6rLXRn0m4KUMx@builder.lan>
In-Reply-To: <YRr6rLXRn0m4KUMx@builder.lan>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 17 Aug 2021 10:15:52 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0_dS_wvWSLx4RmnGc5dwYFyrsPrVNBAGs1DTXnWWoX-g@mail.gmail.com>
Message-ID: <CAK8P3a0_dS_wvWSLx4RmnGc5dwYFyrsPrVNBAGs1DTXnWWoX-g@mail.gmail.com>
Subject: Re: [GIT PULL] Qualcomm ARM64 updates for v5.15
To: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Doug Anderson <dianders@chromium.org>, arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Andy Gross <agross@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@baylibre.com>, 
	Konrad Dybcio <konrad.dybcio@somainline.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, Vinod Koul <vkoul@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Alex Elder <elder@linaro.org>, 
	Bhupesh Sharma <bhupesh.sharma@linaro.org>, Stephan Gerhold <stephan@gerhold.net>, 
	Rajendra Nayak <rnayak@codeaurora.org>, Sandeep Maheswaram <sanm@codeaurora.org>, 
	Thara Gopinath <thara.gopinath@linaro.org>, Caleb Connolly <caleb@connolly.tech>, 
	Georgi Djakov <georgi.djakov@linaro.org>, 
	Gokul Sriram Palanisamy <gokulsri@codeaurora.org>, Judy Hsiao <judyhsiao@chromium.org>, 
	Martin Botka <martin.botka@somainline.org>, Robert Marko <robimarko@gmail.com>, 
	V Sujith Kumar Reddy <vsujithk@codeaurora.org>, Baruch Siach <baruch@tkos.co.il>, 
	Felipe Balbi <felipe.balbi@microsoft.com>, Jonathan Marek <jonathan@marek.ca>, 
	Kathiravan T <kathirav@codeaurora.org>, Kuogee Hsieh <khsieh@codeaurora.org>, 
	Ravi Kumar Bokka <rbokka@codeaurora.org>, Robert Foss <robert.foss@linaro.org>, 
	Selvam Sathappan Periakaruppan <speriaka@codeaurora.org>, Shaik Sajida Bhanu <sbhanu@codeaurora.org>, 
	Sibi Sankar <sibis@codeaurora.org>, Wesley Cheng <wcheng@codeaurora.org>, 
	Yassine Oudjana <y.oudjana@protonmail.com>, satya priya <skakit@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:UNROrRyLHsqO/+jx5dgczVmsYNSuwiIkoy85dic86SiYNHJjiOZ
 6eGpHVZxe7WAkkyqpaug2ERjesTF2mAREPmWPzSCYzqRKb4/0jCTcdcBkB8WLjzx4mFy7sM
 +hRU66c/LtHD427dkpaulwqQNclGwy/DuqfJBxKykRtoxA4YNNMG2fj6PxQP4HuTejZkIms
 W+bSfNkL+Vhyn4nJkkf+w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:kZlDu9WfCCs=:HF4LbpAS1BCw+/U2rI1SeG
 jxqdeziZUjiIJjTJawidlQ31r6Q6uWARheeZ3iPECs7QBbb7MYSxruoi7nLM6tJo05ljDWdRB
 0NPEFSvUPWT3tWhbDJwWAOKyO9a3IZC9+CKNpDXgByfD/i4GRu30PYWI38G6VQiPYgMWgHl9s
 Fk/Q8JErtkIThqU5mScai6KRPvV/qLc4kTM+KAN+OhWvC3i9SSh37/p+dHNYlFlkU+VPK20AA
 JdiFuW2slLLcaL+myYoBM4qwxsJHeXV6HAL2IfcQpJIWdOnXL1hT6jktfrwU/YzJLtnb/Dnj8
 FVzMA7rkUBVwjKnQwvMn8Hpj9rg3FPawKfrapoF89XckhnE99nmIWWr3lrj5F9vNx93xSPlgn
 i/RyJ+aqMCP7A6dPqmVyKntduVMJxposHuTeaGSL9mJcXGRtw2nauoNIp2JYd+0xm7Ujeik89
 9URkhmbxxlvzyYZMpKINIgG51IGFGjpF/F6K+mKTtusGsgvKn8fiGWVB1CblUsOMAO2YJzgYx
 KGj8MWWpwckCWViRyqOdeGFDavqnulDThRpdENMN7Y6BcmCLuQHVzfxJ1mJOwCIHvS170C/xE
 0jW9VysQcKtnsgQFYEqxS8eLBcvqNNeBBld/wAIATSH0XZu3JrIaqHzFtmLBbUPFpClP+OM7l
 x/ccUCKo7RPbMWkEW46CcTonT0atlNPOivUwetIgRqtfRdt2SK2o9tVbmYFyLSacnSmwSsOZT
 GYOpAsCqIpxlL8Dq8bK6qZa3zRmGuiBItdlw/MuDKnPT9KrC1pMn/PYdW1N0Ph2y4t+XHqdtC
 BfzqFkLkqxLX+kBjNDPM6VQTX0ixPGGUBjE6VxxJAMZL4ibkkz3F3f5KRuP2/r1ZxSeI72R+p
 umdaHfYUmywmqvgBjY6FCfcqxaPQeCY3KQjOo3KT2v/kNUic7dA8eH7ZvCwnODAox9tH1yAwK
 zUtr/+RlwKxvc+WQE6ee13bQFe3/H3PYuQxO0cQNrKmT+P8ndkPOi

On Tue, Aug 17, 2021 at 1:54 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
> On Mon 16 Aug 18:41 CDT 2021, Doug Anderson wrote:
> > On Mon, Aug 16, 2021 at 4:12 PM Bjorn Andersson
> > <bjorn.andersson@linaro.org> wrote:
> > >
> > > Douglas Anderson (1):
> > >       arm64: dts: qcom: sc7180-trogdor: Move panel under the bridge chip
> >
> > I hope the above patch doesn't cause problems. I had landed it in the
> > drm-misc-next tree as per:
> >
> > https://lore.kernel.org/linux-arm-msm/YMDdyEzCpdttQyNu@builder.lan/
> >
> > Presumably git will magically do the right thing here since nothing
> > else on nearby lines is changing, but I at least wanted to point this
> > out in case there are any issues. Right now in linuxnext I see both
> > changes:
> >
> > ab428819ee3f arm64: dts: qcom: sc7180-trogdor: Move panel under the bridge chip
> > ab6f24b404c9 arm64: dts: qcom: sc7180-trogdor: Move panel under the bridge chip
> >
>
> Yes, we agreed that you should take it through drm-misc and I must have
> forgotten about that as I drained the patchwork queue.
>
> This has been sitting in linux-next for a while now and I've not seen
> any reports from Stephen, so I think we're good.

I just double-checked that the merge went in properly, sometimes
this kind of patch causes entries, but in this case it's fine.

        Arnd
