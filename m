Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD652FF155
	for <soc@lists.linux.dev>; Fri, 27 Mar 2026 08:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774601571; cv=none; b=PKPGKfxA4u44LDXfy4lk+xccfuOrFiYw3zsXG346k7QMjoWQvaNehnyWs4bZ59GE0QDzj6zHwky+HtOYnZhqd9oHliPqL+08+TltTAom2DL2MT47yOq3D1KHQ1g8UUGLKuvn0nJwPytHnI2ItbFCjJYKAL2Ed1RlMXR/x55tBxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774601571; c=relaxed/simple;
	bh=jxxRgKpfxEvp77H5FRxPple/0zkWZ9vpz2rvXeyZ/QM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=klReSZoJshcC5NLj9FELrADhf3J+PsM6uS0xzykY56Hc+nCPzEtSL40EWVbIuKT2GLhlMEIzymDlU701g6NAYRd0Qd13E+TzfJuGB+qfEjdmT1EFXOY7edklHm+11xRvI2ctmA5MwOVroNGgGnMYl7j+pNr1/o2+NYYZnwXlMMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 35B6AC2BC9E; Fri, 27 Mar 2026 08:52:51 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ED832C19423
	for <soc@kernel.org>; Fri, 27 Mar 2026 08:52:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org ED832C19423
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a2792e8799so283894e87.1
        for <soc@kernel.org>; Fri, 27 Mar 2026 01:52:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774601568; x=1775206368;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IRXASae8rN7IgVnVI5FCS0dcfVmSoJg6Qz5lniabiXI=;
        b=jmT/NPrkwj9UnvjC3/0I7j91gEJPeioAoPgZSdQFL+ZvmS4SCbMdgQJ6CnqpGhijqX
         EENnUjKv4Nel+QuSO2x1ree7/fXFwyxDuF0h1bJ3cKSjZeYj+zVRaYm2OEm4FI9NFqg1
         LhSo8wL2vviXFE/rpXy7sV5coHEDxC49yh5cn1tEctaKAhWj3HQsQebqEs5bfz2Suzfg
         j8D1Kt2COGBObLFTpogye0vxKzPvNRWMnNTN18jh+Q/jib1wtMrlE5zpjvbOvLEXW95L
         kl0V7wehMkp+bVmFbtMuEuTybr8p0Qu2iyJH2sXvNeI6SuAfF7LEEokfab7bphrPKFf+
         lo5g==
X-Gm-Message-State: AOJu0YxvdDGYkZ8UuGVYVTjvmA2eyT7NJlc5oNV9uIo/fnBK6/fOiJaQ
	aIPCQvxAbiMrQNJjlBaZDfytaatnhAdD6Oupvn6QZV+usEzR36/Eg4LH
X-Gm-Gg: ATEYQzwGRHX38aKzaytK64518HJK1g4O53atoErRzD1CnNWS5xe+RU2ujzY73ikJ9w8
	kRZ2mJo0EJPc6WrNFq917UQJDnzv+DfUFwzGt0Q+b+JxDYNGkXpnCbGoTlUl0Y2tcRe1y8EtbLI
	ZYUTXY1x5phsdCjQyv61SdoUZg3yZIVF2Quczvogg/v4fi1MN77TmST72lngp+XCoab1v+rIYNo
	gHqkVP9uBySph1jToeNiRtxlsXfvmPMagY/DQIoPnZNfAhRgTd+OMyy87Qu2XctUSUGQYk0JDZD
	ku6PQJKrLRnHmGj3vofCHxUlQyq2Dat5fKvLBB2LeFgN7+H+hGNMJg0I0eRqDO1ffwwBRLeZwGJ
	lbnkKMQiemwkxQonB5FW8cJVCrx+TR7XE8y98s8p87lFhfb/sgEKHZlRvm3JXwLAW+QuuntNNQj
	xyMtOAOAio8p6OI1wlJHGGagOHZR5uoiJBurTaC506dX1vSUE=
X-Received: by 2002:a05:6512:124b:b0:5a1:38c4:424e with SMTP id 2adb3069b0e04-5a2ab92aa0amr336078e87.7.1774601567731;
        Fri, 27 Mar 2026 01:52:47 -0700 (PDT)
Received: from localhost ([176.106.245.85])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2a0689283sm1252299e87.44.2026.03.27.01.52.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 01:52:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Mar 2026 11:52:45 +0300
Message-Id: <DHDFR4K758TP.291K17J2J5VL7@altlinux.org>
Cc: <soc@kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, "Hal Feng" <hal.feng@starfivetech.com>,
 "Conor Dooley" <conor@kernel.org>, "Heinrich Schuchardt"
 <heinrich.schuchardt@canonical.com>
Subject: Re: [GIT PULL] ~RISC-V~Starfive devicetrees fixes for v7.0-rc6
From: "Ilya Sorochan" <k0tran@altlinux.org>
To: "E Shattow" <e@freeshell.de>
X-Mailer: aerc
References: <20260326-astrology-rephrase-836ec663228b@spud>
 <4dd4ffe6-307a-442b-ae99-50c88d4e5b84@freeshell.de>
 <20260326-viscous-rigor-4beb18f77eec@spud>
 <9ec329b9-144f-4896-a89c-3af0b23e631e@canonical.com>
 <DHCYMK8FEH10.1Y1YWLL3J1HSK@altlinux.org>
 <ff792101-61e3-4470-9c5c-eea375edc9fa@freeshell.de>
In-Reply-To: <ff792101-61e3-4470-9c5c-eea375edc9fa@freeshell.de>

> On 3/26/26 12:27, Ilya Sorochan wrote:
>> On Thu, Mar 26, 2026 at 07:36:07AM -0700, E Shattow wrote:
>>> ...
>>> I have done an ~80%+ analysis on Ghidra decompilation of the JH-7110
>>> BootROM, and openly invite anyone that would like to help get this
>>> ...=20
>> Appreciate the effort!
>> However I can't see how this is related.
>
> Your patch was sent to a minimum audience which perhaps if you are a
> first time contributor is understandable but I would have hoped between
> you, Heinrich reviewing, and Conor accepting the patch someone would
> have noticed that scripts/get_maintainer.pl was either not used or some
> overzealous trimming of CC is going on! Also this is probably the
> dozenth time I have explained at great length to Heinrich my concerns so
> it is deeply disappointing to miss this opportunity for contributing, I
> guess I consider it disrespectful though maybe no fault of your own
> there Ilya for wanting your hardware to continue working as you
> expected? I get that... there is in no way any desire to discourage
> anyone from posting patches or fixes, this particular situation is a
> headache for me... maybe I'm the problem okay because I cannot reverse
> engineer a whole BootROM on my own, I only get to 80% and then people
> have their own motivations and reasons for not wanting to spend any time
> to do this properly? :)

Sorry, I'm not trying to be disrespectful. Yes, it's my first time. Kernel =
docs
bewarn of spamming therefore I trimmed CC based on the assumption that thos=
e who
interested in devicetrees are present in devicetree lists. I guess it is no=
t
true which seems strange to me, but okay.

I'm not asking to support this feature properly. It would be nice to have b=
ut
it is hard and StarFive is not making it any easier. However I'm asking to =
keep
it working while you can if you can. It worked for me and other people and =
we
would appreciate if you can delay breaking it as long as possible.

>> I traced this property a little in the U-Boot repo:
>> - 503fc8548197 Hal added it to VisionFive v1.3b (with mmc pins)
>> - 6bbe95ef7208 Hal moved it (and other common things) into
>>   jh7110-common-u-boot.dtsi
>> - 27f617019dd0 E removed it with jh7110-common-u-boot.dtsi
>> - 762f85bb2e36 Tom squash-updated upstream dts
>>=20
>> New device trees did not contain this property. This is how they were in=
troduced
>> into the Linux: b127dbf9e1ebbfbcded4 ("riscv: dts: starfive: Add mmc nod=
es on
>> VisionFive 2 board")
>>=20
>> I do not know if this miss is intentional or not. However it would be ni=
ce to
>> be able to boot from SD-card again.
>
> There is already nothing to prevent you from booting Linux from SD-card,
> with U-Boot SPL and U-Boot Main located in SPI Flash as is recommended
> by StarFive officially.

Yes. However I'm implying the deprecated SDIO3.0 way. I agree that this wou=
ld be
nice to have in the commit message - if this what are you talking about.

> I'm glad you sent a patch, but I still object for the other reasons
> mentioned.

I'm glad to talk to competent people in this space, however I still hope th=
at
the kernel will refrain from breaking this feature until it is really neces=
sary.
