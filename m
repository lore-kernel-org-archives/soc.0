Return-Path: <SRS0=OMfa=YG=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C446C00140
	for <soc@archiver.kernel.org>; Tue,  2 Aug 2022 10:22:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C6389C433D7; Tue,  2 Aug 2022 10:22:53 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B79DDC433C1;
	Tue,  2 Aug 2022 10:22:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B79DDC433C1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-ed1-f42.google.com ([209.85.208.42]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MvavG-1nTTFX2lPC-00sggV; Tue, 02 Aug 2022 12:22:49 +0200
Received: by mail-ed1-f42.google.com with SMTP id b96so6696723edf.0;
        Tue, 02 Aug 2022 03:22:49 -0700 (PDT)
X-Gm-Message-State: ACgBeo2gJYZ628AztOd/PD5edP9D32K5erMCSBBMiUml2xhThEVDcVKf
	kffoJMBIdlRURtdPx0Bl1kqK+bIDZ2k8ScI/6pU=
X-Google-Smtp-Source: AA6agR6xKqx9vTN/nOHiBt/gtZKmltW+NIUpk5T+BocdKNPd4v0uhMXoxwpsOzxJ19d7mha1tdAcdxMt6WaspG541vA=
X-Received: by 2002:a05:6402:3495:b0:43d:d76e:e9ff with SMTP id
 v21-20020a056402349500b0043dd76ee9ffmr5302294edc.227.1659435769265; Tue, 02
 Aug 2022 03:22:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220720230140.2113129-1-bjorn.andersson@linaro.org>
 <CAOCOHw5vj7WExi2opJ+ZvxLroq9UScHMMTuyyysMs3zJEfxgEQ@mail.gmail.com>
 <CAK8P3a2KeNRSfVdd8F5cVp4oU+K+Nwo0bVx_kEVHXEx_0AkZAQ@mail.gmail.com> <20220802095357.uibssv3s72rvlj7p@bogus>
In-Reply-To: <20220802095357.uibssv3s72rvlj7p@bogus>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 2 Aug 2022 12:22:33 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1acYba+g+6zLm1F8o=9U6BdKNDMgapQT-vrV+7hGHg4w@mail.gmail.com>
Message-ID: <CAK8P3a1acYba+g+6zLm1F8o=9U6BdKNDMgapQT-vrV+7hGHg4w@mail.gmail.com>
Subject: Re: [GIT PULL] Qualcomm ARM64 defconfig more updates for v5.20
To: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <bjorn.andersson@linaro.org>, arm-soc <arm@kernel.org>, 
	SoC Team <soc@kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Andy Gross <agross@kernel.org>, 
	Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:O00kb9F3ANrzdr6cz46524pxgcmPdE8e0qbHxDe9Pbis196Elng
 zQr5GlTiSRyEaE9JP3mp+Z7vSOPyEUo1eXrO+AtL8kmn7i0FfQfYAP9HtKfYk41Xa1NVndz
 vMCnHfCNqaiAwGbuHzkg8YBruTYNutkmjS0joN5+VS8wTbx1mS7vnTpQTk/1i+eNA7GmIzw
 Cpxx/6h4UNXtsCfCd+m7Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:EBsC1DK3mCE=:3iufrugH2HnaGzSPeK0Dqg
 xKUhbmvwfOLzuAlJ++GGsWFHpX8C6dOHTgjNELFt5dYt1+xu81CDqtD+bsFrOPdhxzLlPhtxc
 Lf4AlPaNd+QPs8kTPGbX3/ntvdO75/zKdYhCcFCq7ndmjdcypIDxJ87y1p6RoLjbc2yjPEO0a
 kNRKrrwrP4cDu9g+xYJe7p6iEHflCNLBBGQnbUGcYLM3rEWGqarGproNTU73QJVF3mK0iBHwy
 p1Fhz+cGwbraxqK5VCxjDdkah6A2eeVDDtw6ypin/Ru4WV8v+dE7/15yfjC/qEa4Wg6qdPe8+
 IGLxCl4ZHAavcAmJV6EOsMdfgL++XyCa2ucAjgCTK9kMZqrLlXXxQq2jzAgSps64sQ3P+IuU2
 FR3A3234M9s4c8y59nfIyo0SuvYU//dA0BARracxhSaVTFzUIyutDwDhVsi1kh44khfNpsz2w
 uBA+5Pk7S0FgKWFeBKU/vGVk07129MVE0wrvmuNkZbTnCC1vx55RT8pCEL58k48VaF/6CZUPS
 3WBalfOna7QIAStuyVkVJNRB8J6+gujEpn7/ZWNlTsa1vrnrFo2DG0Nruwsh2oav7V69lc7Cp
 Rq//NoeoNEi6TDOCkmH1OprpkxIqsELMLqZz5xLUznfl8MWYQfPBGRuIZlsn2ogpnjF/UUIGP
 HOAHGzIbskyHkMcbuaAG81rUXnDyrur0V/XlfEBTxYnd6AHs2nWf23MRloJbcMMiUk0qEZ3PT
 LLnMKZe1mIK9Lwu49dBn1N0wgeLI+8RixgfaKpk4jpBzzzi61Oi2SdAfeHjTh8ZVwMRtmC+Q+
 KNiqaKRatiqZ0uCZhhPWPAraMzstn1gZvLLKYfiMeFHBVpFkhNzmqi9ZKWyE/miL+ZSsUpK9f
 LLn7XRLeJU68yx0G1Y+w==

On Tue, Aug 2, 2022 at 11:53 AM Sudeep Holla <sudeep.holla@arm.com> wrote:
> On Tue, Aug 02, 2022 at 11:44:16AM +0200, Arnd Bergmann wrote:
> > On Mon, Aug 1, 2022 at 5:35 AM Bjorn Andersson
> > <bjorn.andersson@linaro.org> wrote:
> > >
> > > On Wed, Jul 20, 2022 at 6:01 PM Bjorn Andersson
> > > <bjorn.andersson@linaro.org> wrote:
> > > >
> > >
> > > I don't seem to have received a response on this one, can you confirm
> > > if you were able to pick it up for v5.20?
> >
> > Hi Bjorn,
> >
> > sorry I missed sending out an email. For some reason the automatic notifications
> > don't work for some senders and I have to manually chase those up.
> >
>
> Ah that explains why I didn't receive notification as well. I noticed
> the changes were pulled. I didn't bother to ask, but now that you mention
> it is likely to be the sender address as I can't send you email to your
> @arndb.de and hence I always use kernel.org. Are these automated emails
> sent via arnd@arndb.de ?

I don't think it has anything to do with my email address. This is about pull
requests that get sent to the soc@kernel.org alias. Patchwork monitors these
and puts them into https://patchwork.kernel.org/project/linux-soc/list/ from
where I can pick them up or reject them using pwclient. Anything sent there
requires an action to get it out of the list of 'New' entries.

In most cases patchwork will then notice when I push out the merge commit
to the for-next branch of the soc tree. However for some senders (Bjorn and
Krzysztof notably), this only works for patch emails but not pull requests, so
I have to use 'b4' to to send an 'applied, thanks' message myself, which I send
using gmail with my kernel.org address as sender.

         Arnd
