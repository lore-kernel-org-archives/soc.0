Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94F64302F8
	for <soc@lists.linux.dev>; Tue, 11 Aug 2026 10:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786442616; cv=none; b=EJqnhqqPeSXlfZNUgbeFWwtpZn4ezHWrXaBzpA2J1TYYLBOTisPkNc3yh9lmU4RegOmgkX3j2fDSRgBe2aj3Tc7caaf/EksKtk+H67O/bFkJEb/UDxqyMiC/n7IqRB8hzg0xy+XDWdRpxrzyrMrVeyEZ2cjEcGVsumNTSzGHOiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786442616; c=relaxed/simple;
	bh=KuQKWxoV/XqAzzIt2eOByfa0yezRtUnVGXz4aWT8Qlc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d6a0G/1Dg50qcrV/4lMzWTvRxiKBKn8ZoeKp8aLzvZ6WraF10582CcDWv/SYagVTI44fq2HBID8G3udcqyFRyzQL08nULkmFpS0BkuRsn4qA6lG4bAfRmzprjh0H+RoDWnbmma0KnPgG7h1VgYZGTqmyfHKoFjIA7qJFWLktUYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SUKu6Pdd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SUKu6Pdd"
Received: by smtp.kernel.org (Postfix)
	id 0C7651F00A3A; Tue, 11 Aug 2026 10:03:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A4871F000E9;
	Tue, 11 Aug 2026 10:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786442609;
	bh=u/IzL0ZgCIvODGVKGV0oRzG71HOWOlAnML9MbCNUtjM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SUKu6PddNdSmymN3z3JFDIpGFuh7jtkV92p8UZddrFXDiftC6Dwp9rKe0H42YqlBh
	 84CmCk4XzwbrsqAOqOKOTLW/rrJMefc7WtZvqs3sIZmThIY5CoiS04++D8MzUdd8iD
	 6vIAybKXgtRWRw8hisxWbbz3eQFLhVMORHRQntC2h5rs9gfT96u2uk4Bd+tDPiUWGl
	 Zt5qj3ugNuNhVKjbGQJtqHsLwGyTLZsIy9MUznTClr2WJaSYD7waVEM5QKQJUbwNbN
	 BAdIPGRiTKn7Byh5W9byyzdomibM3qftZgYuVE16QgnoDHIDcrdIdUH0dkY3T9icja
	 jao7MZMMUDsAg==
Date: Tue, 11 Aug 2026 10:03:27 +0000
From: Yixun Lan <dlan@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>, soc@kernel.org,
	spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] RISC-V SpacemiT Devicetrees for v7.3
Message-ID: <20260811100327-GKA277506@kernel.org>
References: <20260802024052-KYC1424545@kernel.org>
 <93faefb2-5cd4-439c-a4a5-842ca5407975@app.fastmail.com>
 <DKLRT9TOCY0W.1ZZ35K3S4Y5E7@linux.spacemit.com>
 <cec87950-f0e1-49f8-9a2c-f8b87b460da2@app.fastmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cec87950-f0e1-49f8-9a2c-f8b87b460da2@app.fastmail.com>

hi Arnd,

On 09:22 Tue 11 Aug     , Arnd Bergmann wrote:
> On Tue, Aug 11, 2026, at 04:49, Troy Mitchell wrote:
> > On Tue Aug 11, 2026 at 12:45 AM +08, Arnd Bergmann wrote:
> >> On Sun, Aug 2, 2026, at 04:42, Yixun Lan wrote:
> >>
> >>> Troy Mitchell (1):
> >>>       riscv: dts: spacemit: k3: add i2s0-i2s5 nodes
> >>
> >> This commit caused a build failure, so I reverted it for the 7.3
> >> merge window:
> >>
> >>     Lexical error: ../arch/riscv/boot/dts/spacemit/k3.dtsi:1181.20-39 Unexpected 'CLK_MPMU_I2S_SYSCLK'
> >>
> >> Please make sure that each pull request you send is free of
> >> build failures and warnings and works on its own.
> >>
Ok, Learned

> >
> > The missing macro has been merged here [1].
> >
> > Link: 
> > https://lore.kernel.org/all/20260717-k3-clk-fix-i2s-v1-1-e95001a692ee@linux.spacemit.com/ 
> > [1]
> 
> Right, the problem was that your patch to use the macro was
> applied on a different branch that caused the build to
> fail. Yixun Lan should have caught this problem and rejected
> your patch before sending the pull request when doing
> a 'make dtbs_check'.
> 

Sorry, I didn't catch this problem due to test DT together with the 
clock patches.. I'll be more careful next time to send a PR without
unmerged cross-tree dependency, thanks for taking care of this..

> This is a common problem with unstructured SoC devices:
> If you can't just use the number from a datasheet, you
> have to wait until the binding has been agreed and merged.
> 
> Earlier in the cycle this could have been resolved by
> ensuring the binding change is used as the base for both
> the clk driver and the dts branch, but now you'll have
> to wait until after -rc1 is out to resend.
> 

-- 
Yixun Lan (dlan)
