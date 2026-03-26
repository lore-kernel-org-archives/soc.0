Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB55392C50
	for <soc@lists.linux.dev>; Thu, 26 Mar 2026 19:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774553255; cv=none; b=c4WqodfSYAYNcZJoTz2KLpK+ab/hAvHJf3edtCva8rsCjkbEhZVnLRUMOXvVMJbY5gXadrjZaRy0XxJBgpOoUGaThFngwjuUVwAsfC6/ZGqRzGsTx5Pnbx3XVwvTB7h1LnnhklcVdtMGdbMOoqkWuQGTF8BeOh/5gWgenIsUFbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774553255; c=relaxed/simple;
	bh=oBMMAlwinubRFddv3ZGCCH1xk3ZumPAvVXDHSRlSvQ4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=tyq+heRoLOM7QYjmn7QfBUhwJufvhF5CdqgRxSvq40XDsivFkv0nVs9GkopgFnUZUDvx1V3RUzZ58/r+IHceu2VxkeMw9QoiGLLVOyc7hS33LMUQjii64EFgKFCSqxugErTHAgYfDCKx+xZfxtu855KZrbqO1WE9oBRpzJo5E0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 465F3C2BCB1; Thu, 26 Mar 2026 19:27:35 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 20763C116C6
	for <soc@kernel.org>; Thu, 26 Mar 2026 19:27:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 20763C116C6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-38a365f1869so956871fa.3
        for <soc@kernel.org>; Thu, 26 Mar 2026 12:27:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774553252; x=1775158052;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a4U37jloRCxGaogcODaSOdFLwJV6DsZwdbebE3/dYeE=;
        b=Hq47a96E+R/8V0DFaVGv7u8XCEOURMGbXsspnotwq7spSYoaqqZnUX80S1sWU+Cvig
         bYRtfvouhsjv4OweMXmhy41qDDoe/ZtO42VTQ8LpHbCZxElcidbzSls+gBen1v3C27uF
         Ynrb0qcFKLuc6WuFFPRP7U+kFT43vUDvBsxLZLfxD2jO6HA8RQHi0TnTRno07+5K+qGQ
         +MvOWrtgDfFicvJZcMrCpQnDKRfO/JkitWGhkO4sVuk8JyD+TOmsV0dTwJ759fGZ1vDT
         rbdITccJGZSPZZDVMgQ4G7eYnmovCmSRHRoWqDxA+TVuMe1jbja5dlHBtxOpccofNidL
         yiGQ==
X-Gm-Message-State: AOJu0Yzn04YAgGL4L2zQjuY8/BryDz8GfTCTtvGaB3QfU0M8fWcyB1oo
	XbpK1VRF+r4BBN5L2SFAhuVAT7O5oRRws03xPS+KFG2Acdp3qrQhW5vr
X-Gm-Gg: ATEYQzwEQStXRQ1Y9Vh140M19BZ3XEotZ2JI+0nroDi6O0nyWPrQfYPqtFNGjGya0A4
	LNUpTLOScru8Xx87HCwypH2NeBVehgsxm+hsEBzJHO806KMviips9515FMzsLrYTGlBZze7jGDK
	tPetK+x7SImKM3UlGC9Un/nYJCEsL3TYHfGbYJdRL4bTWdtbcg3odlKf2e0+lTdIRiaEehg8YM9
	r5/TO1FHFTb7B1Xi1HdKVZVoMqrwbTB033Bekpi4nhdm+Kfcrvump6VHc0I7SVPW4CLB4iOpZCt
	71y12i8+Hv0HWDy3L30Gx9GzncVXJTUCeHKa7rVO4avO6LsS+aFo9Hi7bG7kvii9Sx+eapH1+xg
	cqQsmKIK2aQpZBzvinBV0a8DvRLJfMw0LgbUhArNkAvKKRW899OyeA+hSMdQ+39yj0RG4DANIpG
	zxY8uYS1ogRLD2DbFMp3LJY5QLbciNC69v5w0Cy2laREDZ1dA=
X-Received: by 2002:a05:6512:3090:b0:5a2:845e:9d9a with SMTP id 2adb3069b0e04-5a29b9a6f5bmr1894370e87.6.1774553251990;
        Thu, 26 Mar 2026 12:27:31 -0700 (PDT)
Received: from localhost ([176.106.245.85])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2a06486a7sm791414e87.25.2026.03.26.12.27.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 12:27:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Mar 2026 22:27:28 +0300
Message-Id: <DHCYMK8FEH10.1Y1YWLL3J1HSK@altlinux.org>
Subject: Re: [GIT PULL] ~RISC-V~Starfive devicetrees fixes for v7.0-rc6
From: "Ilya Sorochan" <k0tran@altlinux.org>
To: "E Shattow" <e@freeshell.de>
Cc: <soc@kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, "Hal Feng" <hal.feng@starfivetech.com>,
 "Conor Dooley" <conor@kernel.org>, "Heinrich Schuchardt"
 <heinrich.schuchardt@canonical.com>
X-Mailer: aerc
References: <20260326-astrology-rephrase-836ec663228b@spud>
 <4dd4ffe6-307a-442b-ae99-50c88d4e5b84@freeshell.de>
 <20260326-viscous-rigor-4beb18f77eec@spud>
 <9ec329b9-144f-4896-a89c-3af0b23e631e@canonical.com>
In-Reply-To: <9ec329b9-144f-4896-a89c-3af0b23e631e@canonical.com>

On Thu, Mar 26, 2026 at 07:36:07AM -0700, E Shattow wrote:
> To be clear the "riscv: dts: starfive: jh7110-common: fix jh7110 SoC
> boot from SD-card." commit does not affect Linux whatsoever, there is no
> problem to boot Linux from SD Card impacted by having or not having this
> commit. This also is not common, so should not be in jh7110-common, as
> more JH-7110 SoC products by-the-numbers have transistor logic replacing
> this signal selection to the StarFive loader in BootROM and so
> precluding this from functioning.

This commit affects U-Boot+Linux ability to boot from SD-card.
Tested on StarFive VisionFive 2 and Pine64 Star64.
I'm not aware if this is the same for other jh7110-based boards, but assume=
d so.
=20
> This ignores the wider discussion about StarFive both deprecating this
> capability (for Secondary Program Loader i.e. U-Boot SPL) of StarFive
> Loader in JH-7110 BootROM loading from SD Card being deprecated
> officially in the latest StarFive JH-7110 Technical Reference Manual and
> StarFive JH-7110 Boot User Guide documentation, and the ongoing GPL
> non-compliance by StarFive for use of GPL 2.0+ code in the JH-7110
> BootROM; the latter being important if we want to accurately attempt to
> support this deprecated feature set as a community (even when ignoring
> for the moment this copyright license non-compliance).
>
> I have done an ~80%+ analysis on Ghidra decompilation of the JH-7110
> BootROM, and openly invite anyone that would like to help get this
> effort to 100% is welcome to so that we may publish and refer to this
> for technical competence. I do not object to the community supporting
> this deprecated capability if there is any real documentation not based
> on rumors and memes; but no one has offered to do take a moment to do
> this most basic of fact finding. Evidently the StarFive maintainer(s)
> have refused to support this, GPL non-compliance persists and only a
> rough description from Hal has been written to the U-Boot developer mail
> list that does not match my analysis, all while complaining about the
> capability not being supported going forward.

Appreciate the effort!
However I can't see how this is related.

I traced this property a little in the U-Boot repo:
- 503fc8548197 Hal added it to VisionFive v1.3b (with mmc pins)
- 6bbe95ef7208 Hal moved it (and other common things) into
  jh7110-common-u-boot.dtsi
- 27f617019dd0 E removed it with jh7110-common-u-boot.dtsi
- 762f85bb2e36 Tom squash-updated upstream dts

New device trees did not contain this property. This is how they were intro=
duced
into the Linux: b127dbf9e1ebbfbcded4 ("riscv: dts: starfive: Add mmc nodes =
on
VisionFive 2 board")

I do not know if this miss is intentional or not. However it would be nice =
to
be able to boot from SD-card again.
