Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842072E9733
	for <soc@lists.linux.dev>; Fri, 27 Mar 2026 04:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774587223; cv=none; b=eSFnW+EmF6GHBdpM70JhDe//hOHVMdBnIG5JRe7chZ6uZg+x2uNMnFw1Qxv2PEQtDqckeNYPcw0dUxM6I3326BW2pFkf/qHeMclMGiW8N+A9SpMdvVgs8Qn62HAEAQ+2J82Xg0eyeAK+EVeUvSp4V+4eOGVCXyjeYbhb8o4ec+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774587223; c=relaxed/simple;
	bh=tOV/ALOhOKMGGBhqO04mbZxp6O6m6aOIBn1oxJKYHDI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dqt7ucg0e3k6TGdHbYokKAo7fo3MFw5k6fD7j7x+2Wqun/RI4c8hC11CsYjQxs6nHQFt4OcEFok2SmX2hb/q6YDRBkhbPQW207oyVKrHVQeAXfiIP1QVHQOTlmPQpi71eXamqvvqSGaiQGu5TledSXcergwqRY/yfAI8eOVd2jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=freeshell.de header.i=@freeshell.de header.b=OyzFOOoA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freeshell.de header.i=@freeshell.de header.b="OyzFOOoA"
Received: by smtp.kernel.org (Postfix)
	id 2EB56C2BC87; Fri, 27 Mar 2026 04:53:43 +0000 (UTC)
Received: from freeshell.de (freeshell.de [116.202.128.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 625ECC19423;
	Fri, 27 Mar 2026 04:53:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 625ECC19423
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=freeshell.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=freeshell.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1774587209;
	bh=GacKySgXwVQnK1/JgDDi8JTXaHTJw1QGc55Q9UaAup8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OyzFOOoAV5xMXpE5AkXHOA1ejBPYQz33BATOcj2a/jD25b6xna8biBzzMa0eITz+F
	 f9Cpv+oPYk/NHDZt7RAiPDOHnBSjUTC8qVYGdQMNEUpLIsAxEzJUCGiyFRvZAiNasB
	 DR66UNHXbCneTZWtS/iSIgaNT7ClAtVMNLlwraYIYTkSAylftzVvC+nSrBstLjjZ9s
	 mYvnT5JWtbj+NhFRTWh6NDuzmBtTzsLB8Tf3cTlvp5hbPo/g977Jz4StRGLUUI9djJ
	 Ov+uKCrjhscHyyICDpst2ayJeYhQWtYfHeu7weFE5d+t+zjI2EWoEaBeYUu0QngEqO
	 MEGhqi4egpb7w==
Received: from [IPV6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc] (unknown [IPv6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 1C767B220220;
	Fri, 27 Mar 2026 05:53:27 +0100 (CET)
Message-ID: <ff792101-61e3-4470-9c5c-eea375edc9fa@freeshell.de>
Date: Thu, 26 Mar 2026 21:53:24 -0700
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] ~RISC-V~Starfive devicetrees fixes for v7.0-rc6
To: Ilya Sorochan <k0tran@altlinux.org>
Cc: soc@kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Hal Feng <hal.feng@starfivetech.com>,
 Conor Dooley <conor@kernel.org>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
References: <20260326-astrology-rephrase-836ec663228b@spud>
 <4dd4ffe6-307a-442b-ae99-50c88d4e5b84@freeshell.de>
 <20260326-viscous-rigor-4beb18f77eec@spud>
 <9ec329b9-144f-4896-a89c-3af0b23e631e@canonical.com>
 <DHCYMK8FEH10.1Y1YWLL3J1HSK@altlinux.org>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <DHCYMK8FEH10.1Y1YWLL3J1HSK@altlinux.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/26/26 08:14, Conor Dooley wrote:
...
> All the patch does is tell bootloaders what stage of the boot they
> should should pay attention to the node, and the link was to a big
> mechanical deletion, with a reasonable comment from someone that
> has a track record.
>

Yes, there is nothing about this (bootph-pre-ram hint) to do with
booting Linux. All boards support the official recommended SPI Flash
location for StarFive Loader in BootROM to boot Secondary Program
Loader, which in the case of U-Boot SPL with filtered devicetree has all
it needs to load U-Boot Main from SPI Flash which has full devicetree
(and so boot from network, UART, SD/eMMC, USB, PCIe... whatever).

Only for a subset of board is it possible to set the RGPIO0 RGPIO1
signal lines to a configuration that will trigger the StarFive Loader in
BootROM code path to attempt to load from the VisionFive2 1.2a or 1.3b
reference board arrangement of mmc interfaces, which are hard-coded
configured as SD Card and MMC. The MMC hardware setup does not "flip"
based on the RGPIO0 RGPIO1 configuration, so boards with opposite
connection order of SD Card and MMC to what the VisionFive2 has are
unable to work with this even if they are able to set those signals.

All newer board designs than the VisionFive2 follow official StarFive
design advice that StarFive Loader in BootROM function to load Secondary
Program Loader from MMC is unreliable. It may work, it may not, there's
no further description published about this topic.

>
> I'm sorry, but I have only a passing familiarity with your work there
> (as in, I have seen you talk about it on IRC and paid no attention), and
> there's no way I would have associated it with this change.
> I definitely was not ignoring a wider conversation by merging this
> patch, I was not aware this was controversial at all!

For that, I'm disappointed to have missed an opportunity to participate,
but also want to know if I'm expected to also regularly scan the
linux-devicetree mailing list for this very situation where a starfive
devicetree "fix" is absent from the "open list:STARFIVE DEVICETREES"
linux-riscv mailing list?

If I had been asked to review this then I would have done so. If it was
mailed per scripts/get_maintainer.pl then I would have opted to at least
reply asking for a better commit message and clarification about what
specific hardware this has been tested for. As it is now I was not aware
of this until the PR.

>> ...
>> I object to this PR it is NAK from me on the basis of stuffing this in
>> sideways without technical justification or review. Also I do object to
>
> The technical justification seemed to me to be multiple people saying "we
> need this added so that u-boot can use the sd-card". The patch has been
> on the list for over three weeks at this point, so there was definitely

I missed this entirely as there was not CC'd linux-riscv or lkml mailing
lists what I monitor for "starfive" in the subject.

> opportunity to comment on it. I don't think I have been unreasonable
> here. If current U-Boot needs it, then I'd still like to have it merged.
> If you work pulls through and this becomes no-longer required, then I'd
> be happy to take it back out again.
>

On 3/26/26 08:44, Heinrich Schuchardt wrote:
...
> Concerning technical justification it is clear:
>
> Distro images have been supplied with U-Boot on SD-card for years and
> the recent work in Linux and U-Boot broke booting them. This needs to be
> fixed.
>

Okay, Heinrich:

https://freeshell.de/e/riscv64/hrv-jhre-JH-7110%20BootROM%20analysis_2026_02_22.gar

Load the project archive file (above) with Ghidra 12.x

https://github.com/NationalSecurityAgency/ghidra/releases

Tell us what you find about why this 'bootph-pre-ram' is needed, with
code excerpts. I want to believe...

>>
...
>>> "riscv: dts: starfive: Milk-V Mars CM Lite broken-cd" as this goes the
>>> wrong way around, it does not describe the hardware; if some external
>>> carrier boards cannot deal with the capability of the Mars CM
>>> system-on-module having card detect line then that should be dealt with
>>> as a dtbo per-carrier board and not be replaced in the dts by a
>>> broken-cd, although at least we had this discussion and Conor made a
>>> decision with all the facts and discussion available.
>>>
>
> As my patch points out the CD line is broken because it does not conform
> to the standard established by Raspberry.
>
> E. we know that by chance you have found a base board that ignores the
> standard.

Two of two base boards, here, are compatible with this CD signal (and
some others that I did find schematics for).

We did identify that the CM4 IO Compute carrier board follows the
official Raspberry Pi Foundation published standard.

Obviously this depends on the base board. I don't believe that disabling
a valid signal should be the default, that is dtb overlay subject matter.

>
> Your patch 4cce8b2503ab5 made my standard compliant baseboard unusable.
> My patch in the pull request does not stop your board from booting but
> re-enables mine.
>
> Best regards
>
> Heinrich

I don't want SD polled when there's a perfectly good card detect line in
the hardware as it was designed! Don't break my card detect due to your
hardware being non-compatible with radxa cm3, fix your broken (if
"standards compliant") board with an overlay.

On 3/26/26 12:27, Ilya Sorochan wrote:
> On Thu, Mar 26, 2026 at 07:36:07AM -0700, E Shattow wrote:
>> ...
>> I have done an ~80%+ analysis on Ghidra decompilation of the JH-7110
>> BootROM, and openly invite anyone that would like to help get this
>> ... 
> Appreciate the effort!
> However I can't see how this is related.

Your patch was sent to a minimum audience which perhaps if you are a
first time contributor is understandable but I would have hoped between
you, Heinrich reviewing, and Conor accepting the patch someone would
have noticed that scripts/get_maintainer.pl was either not used or some
overzealous trimming of CC is going on! Also this is probably the
dozenth time I have explained at great length to Heinrich my concerns so
it is deeply disappointing to miss this opportunity for contributing, I
guess I consider it disrespectful though maybe no fault of your own
there Ilya for wanting your hardware to continue working as you
expected? I get that... there is in no way any desire to discourage
anyone from posting patches or fixes, this particular situation is a
headache for me... maybe I'm the problem okay because I cannot reverse
engineer a whole BootROM on my own, I only get to 80% and then people
have their own motivations and reasons for not wanting to spend any time
to do this properly? :)

> 
> I traced this property a little in the U-Boot repo:
> - 503fc8548197 Hal added it to VisionFive v1.3b (with mmc pins)
> - 6bbe95ef7208 Hal moved it (and other common things) into
>   jh7110-common-u-boot.dtsi
> - 27f617019dd0 E removed it with jh7110-common-u-boot.dtsi
> - 762f85bb2e36 Tom squash-updated upstream dts
> 
> New device trees did not contain this property. This is how they were introduced
> into the Linux: b127dbf9e1ebbfbcded4 ("riscv: dts: starfive: Add mmc nodes on
> VisionFive 2 board")
> 
> I do not know if this miss is intentional or not. However it would be nice to
> be able to boot from SD-card again.

There is already nothing to prevent you from booting Linux from SD-card,
with U-Boot SPL and U-Boot Main located in SPI Flash as is recommended
by StarFive officially.

I'm glad you sent a patch, but I still object for the other reasons
mentioned.

-E
