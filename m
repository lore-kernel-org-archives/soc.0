Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793886968;
	b=L5fvYu8KBeUAvQw369w4/EjqiySf2PMRWl6yyoVN+PyZPOmZoxWEk4o2AdO1JH3VeSkN
	 x4olK1LuHqFT18+TAvqo9hgW09XlbmWD/IU8E7iRc5Q5WbzfoThX3ZwMm1hQIJsiyp0ad
	 5J0Dm8V31sYE/1dWZ6eI4HA86xtCpdgUR/g1xEj8Ewu7B6QL/o9dIi6LOzvv3Tpdp36JB
	 GM6CZy//yQUlHIVWSR2qNqcGh91nhxxBSRuqxlUPNvScYjEX62ozkP6hhlf/dKqHON7rf
	 EFOa+Zt8j6Vu/kcMehTw576rAXasM2b/2rR5UQ91MgVAs/iNOksvuVojNn6eAMgXrXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793886968;
	h=Received:Delivered-To:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=TAD50w4Kgmmwo5lPSjT+aAIMNVyfykU0qm7hKIpfWJE=;
	b=0t5zV/VyenDF/2+Z4vzuhwT1iV/lQpDJtCIba6ef3DfVwVkcvjKh2fP5faCgn0v87nkh
	 22L3BwB7d45ZXz4S82yMSKnoEsFMcP0yf5SOCnEeQtJ4PMz8k0JrN+lV3y9kssnkKOwjz
	 olF497VLE311+fAPosPGKS8Z5yw7pp+mFttJ9TSj1wusldm7imDG19E+zZ/0qlNWV1es9
	 2dSTnuvhROaqVBaR5TYxk1Lk69wOTVkOpsbpXWWJ4FN+qsjMOtomfESi7135yvU+suJjS
	 KGzJG3xSwRrRcMfFsA1beYzS6+0+XwFEUgUkDoJpVqQVCqxA5Em+BBMgLRHwmOqWLdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XdeYV5o4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7999A606A31B
	for <soc@lists.linux.dev>; Thu,  5 Nov 2026 13:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XdeYV5o4
Received: by smtp.kernel.org (Postfix)
	id 69C0E1F00A18; Thu,  5 Nov 2026 13:56:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 184911F00919;
	Thu,  5 Nov 2026 13:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793886968;
	bh=TAD50w4Kgmmwo5lPSjT+aAIMNVyfykU0qm7hKIpfWJE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XdeYV5o4FFKHNhtNT2A9GVAg5b4ZTBernk7rOs899cnx0TEnmoFSNbIWbOIzMlz0U
	 Bdx0KdRvGTGYsyyKqjdb++QSlk09uMeGIcyXWfghAe9vGOgNOc4+2bpzkC2kwQg7d8
	 IM9ll6b+qbZ8Ca04ggAzXfOQ08U1pi41yqrBzT+kTZ6vgp/a1hTmK1q3hLbkk/QYaD
	 3H9ueTpy5SCuojkzBHsZ8xDYvCitMF5kSeEEkPolxgnyLKNpnGAXZl+Wf1ehzYR1Cy
	 +eD7M7VEq8XKyERZVIl2hAt1bgH0fM73uiyd4WoOLVVB4+Du3fNvL05/QzYOM50dmc
	 Zq+trhgrr2g6Q==
Date: Thu, 5 Nov 2026 13:56:02 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>, arm <arm@kernel.org>,
	soc@kernel.org, Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Mika Westerberg <westeri@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
	Sizhe Liu <liusizhe5@huawei.com>
Subject: Re: [GIT PULL 4/7] firmware/tegra: Changes for v7.4-rc1
Message-ID: <20261105-tan-stingray-of-amplitude-cf5cff@sudeepholla>
References: <auslF5pwDHtcNoCy@orome>
 <bcad1d7e-387d-4251-8974-7f0dcd2f9734@app.fastmail.com>
 <autADOKsSVVMn6r9@orome>
 <CAJZ5v0iyaHGj2b7H8g0nqrxvz8GpXiE6hkVp9RM7KF+KDckjrA@mail.gmail.com>
 <autmcaraWcXIoRfZ@ashevche-desk.local>
 <20261104161125.00000523@oss.qualcomm.com>
 <20261105-inventive-partridge-of-maturity-793a2e@sudeepholla>
 <8f45711b-d415-4694-a47a-12d4b7427e0f@app.fastmail.com>
 <20261105-quizzical-wine-oryx-e6f91a@sudeepholla>
 <aux_4NxiWvD9uVev@orome>
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aux_4NxiWvD9uVev@orome>

On Thu, Nov 05, 2026 at 02:31:31PM +0100, Thierry Reding wrote:
> On Thu, Nov 05, 2026 at 10:23:24AM +0000, Sudeep Holla wrote:
> > On Thu, Nov 05, 2026 at 10:54:42AM +0100, Arnd Bergmann wrote:
> > > On Thu, Nov 5, 2026, at 10:30, Sudeep Holla wrote:

[...]

> > 
> > I’ve quickly reviewed the patch; it does implements a custom method BMRQ
> > rather than a standard or out-of-the-box solution. More details on this is
> > used based on my understanding below.
> 
> To get everyone on the same page: in a nutshell, BPMP is a separate
> processor that handles various aspects of power management (Boot and
> Power Management Processor). The CPU communicates with it over a shared
> memory region and a mailbox/doorbell for signalling.
> 

I interpret this as PCC is used where needed and that aligns well with
my understanding.

> > > How does this relate to the EC and PCC interfaces in ACPI systems?
> > > 
> > 
> > I am still evaluating how the BPMP driver is intended to operate on ACPI
> > systems. In the meantime, I share the same questions noted above. The current
> > commit message lists several driver features that may not be required for
> > ACPI, which has introduced some clarity issues regarding the intended design.
> 
> My understanding is that an ACPI systems, as opposed to DT where we do
> this all through kernel drivers, the inter-processor communication is
> done via AML. This is because standard power management operations use
> this same mechanism to enable clocks, deassert resets, etc.
> 

Thanks for confirming this. I think we are almost aligned with respect to
the expectations from any ACPI system firmware.

> > > In current mainline, I see that the bpmp driver is used on DT systems
> > > by the tegra specific cpufreq, memory and pci drivers, but I would
> > > expect that on ACPI those all use shared drivers. Are there any other
> > > users that are not already covered on ACPI?
> > > 
> > 
> > For ACPI systems, CPUFreq operates through CPPC via PCC, MEMIO, or
> > supported backends.
> > 
> > My understanding is that the BMRQ method is called by tegra_bpmp_transfer(),
> > which supports Tegra-specific drivers for power domains, clocks, resets,
> > I2C, PCIe, and memory. On ACPI, these can be abstracted through PCC
> > OpRegions as part of standard methods like _ON/_OFF or other device state
> > methods. Although device/memory DVFS is trickier since the ACPI
> > specification lacks standard methods for it today, the commit message
> > implies these components are largely unused on ACPI systems.
> 
> I think this goes back to the disconnect from the patch thread and
> earlier in this discussion: the intent was very much to encapsulate all
> the power management within standard ACPI methods, and that's working
> fine, hence why clocks, resets and power domains are not getting exposed
> on ACPI systems.
> 

Agreed and I think we are aligned.

> However, there's no equivalent in ACPI to expose these MBWT knobs, hence
> the need to expose this through BPMP directly.
> 

IIUC this is Memory Bandwidth Throttling and shouldn't that align with
Arm MPAM and resctrl framework in the kernel ? We now have MPAM via PCC,
so if the firmware exposes the right interface, you must be able to reuse
that. Even otherwise, shouldn't to make this fit with resctrl ? What am I
missing ?

-- 
Regards,
Sudeep
