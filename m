Return-Path: <SRS0=8lna=YG=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9448EC00140
	for <soc@archiver.kernel.org>; Tue,  2 Aug 2022 09:54:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 66FDFC433D6; Tue,  2 Aug 2022 09:54:03 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id BCC77C433C1;
	Tue,  2 Aug 2022 09:54:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BCC77C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F61F139F;
	Tue,  2 Aug 2022 02:54:01 -0700 (PDT)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 738983F67D;
	Tue,  2 Aug 2022 02:53:59 -0700 (PDT)
Date: Tue, 2 Aug 2022 10:53:57 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, arm-soc <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	linux-arm-msm <linux-arm-msm@vger.kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Andy Gross <agross@kernel.org>, Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>
Subject: Re: [GIT PULL] Qualcomm ARM64 defconfig more updates for v5.20
Message-ID: <20220802095357.uibssv3s72rvlj7p@bogus>
References: <20220720230140.2113129-1-bjorn.andersson@linaro.org>
 <CAOCOHw5vj7WExi2opJ+ZvxLroq9UScHMMTuyyysMs3zJEfxgEQ@mail.gmail.com>
 <CAK8P3a2KeNRSfVdd8F5cVp4oU+K+Nwo0bVx_kEVHXEx_0AkZAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a2KeNRSfVdd8F5cVp4oU+K+Nwo0bVx_kEVHXEx_0AkZAQ@mail.gmail.com>

On Tue, Aug 02, 2022 at 11:44:16AM +0200, Arnd Bergmann wrote:
> On Mon, Aug 1, 2022 at 5:35 AM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > On Wed, Jul 20, 2022 at 6:01 PM Bjorn Andersson
> > <bjorn.andersson@linaro.org> wrote:
> > >
> >
> > I don't seem to have received a response on this one, can you confirm
> > if you were able to pick it up for v5.20?
>
> Hi Bjorn,
>
> sorry I missed sending out an email. For some reason the automatic notifications
> don't work for some senders and I have to manually chase those up.
>

Ah that explains why I didn't receive notification as well. I noticed
the changes were pulled. I didn't bother to ask, but now that you mention
it is likely to be the sender address as I can't send you email to your
@arndb.de and hence I always use kernel.org. Are these automated emails
sent via arnd@arndb.de ?

--
Regards,
Sudeep
