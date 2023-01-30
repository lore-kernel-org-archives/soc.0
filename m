Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D175C636CD
	for <soc@archiver.kernel.org>; Mon, 30 Jan 2023 22:24:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 81107C4339B; Mon, 30 Jan 2023 22:24:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BA79C433EF;
	Mon, 30 Jan 2023 22:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675117456;
	bh=rUrt/K553BODk14r+M79yVWYoxK3CXD/QWYVmFgW8H4=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=INYURyC402rJE9eFtLJ2mi3AfyMHJoi21Ly+fHxMnwjSj6Ab5BJ4C/sRzjTeE6KbV
	 tKIMgq9SYTMaceBndfOS63/2sLlNvTAyVZ1n/XQzhIHMSInujC0AR8k+H66LqftLRc
	 hGPb6Y0frzkv8XvzwKmFTUybIC0lIOvbzQlbMEmS+ZNpIzxd9t2MrzUzZ1Tuh/j/zA
	 uEW+yPvGYgOZ0/Sm/9718sEbZRZ03PYroGhJnTQY3W6F7sHaGIXfWhcgKsAv9ra+w+
	 cSQV+qkg+OlEb1vez7WT/fRqsBkRe7PXcDckWcLwNNAx2EjsOb/zawA2gyQ88qXsEp
	 3ZbTuMHyKkhbQ==
Date: Mon, 30 Jan 2023 16:24:12 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: arm <arm@kernel.org>, soc@kernel.org, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Andy Gross <agross@kernel.org>, Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Guru Das Srinagesh <quic_gurus@quicinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Dawei Li <set_pte_at@outlook.com>,
	Loic Poulain <loic.poulain@linaro.org>,
	Melody Olvera <quic_molvera@quicinc.com>,
	Naman Jain <quic_namajain@quicinc.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Yang Li <yang.lee@linux.alibaba.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linaro.org>
Subject: Re: [GIT PULL] Qualcomm driver updates for v6.3
Message-ID: <20230130222412.t2tkkhqfep2orxf2@builder.lan>
References: <20230126163008.3676950-1-andersson@kernel.org>
 <cdcff86c-77fe-4c5d-b8e8-58b815b9e969@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cdcff86c-77fe-4c5d-b8e8-58b815b9e969@app.fastmail.com>

On Mon, Jan 30, 2023 at 04:18:45PM +0100, Arnd Bergmann wrote:
> On Thu, Jan 26, 2023, at 17:30, Bjorn Andersson wrote:
> > The following changes since commit 6049aae52392539e505bfb8ccbcff3c26f1d2f0b:
> >
> > ----------------------------------------------------------------
> > Qualcomm driver updates for v6.3
> >
> > This introduces a new driver for the Data Capture and Compare block,
> > which provides a mechanism for capturing hardware state (access MMIO
> > registers) either upon request of triggered automatically e.g. upon a
> > watchdog bite, for post mortem analysis.
> >
> > The remote filesystem memory share driver gains support for having its
> > memory bound to more than a single VMID.
> >
> > The SCM driver gains the minimal support needed to support a new
> > mechanism where secure world can put calls on hold and later request
> > them to be retried.
> >
> > Support for the new SA8775P platform is added to rpmhpd, QDU1000 is
> > added to the SCM driver and a long list of platforms are added to the
> > socinfo driver. Support for socinfo data revision 16 is also introduced.
> >
> > Lastly a driver to program the ramp controller in MSM8976 is introduced.
> 
> Hi Bjorn,
> 
> I don't feel comfortable merging the DCC driver through drivers/soc/
> at this point: This is the first time I see the driver and it introduces
> a complex user space ABI that I have no time to review as part of the
> merge process.
> 

The DCC driver has made 22 versions over the last 23 months, but now
that I look back I do agree that the recipients list has been too
limited.

Further more, due to the complexity of the ABI I steered this towards
debugfs, with the explicit mentioning that we will change the interface
if needed - in particular since not a lot of review interest has
been shown...

> I usually try to avoid adding any custom user space interfaces
> in drivers/soc, as these tend to be things that end up being
> similar to other chips and need a generic interface.
> 

I have no concern with that, but I'm not able to suggest an existing
subsystem where this would fit.

> In particular I don't see an explanation about how the new interface
> relates to the established drivers/hwtracing/ subsystem and why it
> shouldn't be part of that (adding the hwtracing and coresight
> maintainers to Cc in case they have looked at this already).
> 

To my knowledge the hwtracing framework is an interface for
enabling/disabling traces and then you get a stream of trace data out of
it.

With DCC you essentially write a small "program" to be run at the time
of an exception (or triggered manually). When the "program" is run it
acquire data from mmio interfaces and stores data in sram, which can
then be retrieved - possibly after the fatal reset of the system.

Perhaps I've misunderstood the hwtracing framework, please help me steer
Souradeep towards a subsystem you find suitable for this functionality.

> Can you send an updated pull request that leaves out the
> DCC driver until we have clarified these points?
> 

I will send a new pull request, with the driver addition reverted. I
don't think there's anything controversial with the DT binding, so let's
keep that and the dts nodes (we can move the yaml if a better home is
found...).

Regards,
Bjorn
