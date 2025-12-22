Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F9130FF37
	for <soc@lists.linux.dev>; Mon, 22 Dec 2025 10:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766397954; cv=none; b=V80vl13/L7grWD29G8CpQUQj/UVRxLL6T/WLDACJDe0M1PN2u1/B0Kw/Sn3VErYj1bZdHmWdBbmgaElDuZ2jd0S8u66ffXAPZUTL42P3ZNDBbG9xANeceliG/iF9TwsCbfW1n/BeqqSMC/PvOP98BMrQ8ZoQ6ynZcYntEwskloE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766397954; c=relaxed/simple;
	bh=zGq4ggfr/5r3cP3TvgM/5sBKvQSbzMvvoNBA0QQ30YA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pa8EEYJ8J34g0owY1AHACAGDL+Isr9rC/M6L1aTpDExJrYEpyZcInnEjGhugEwBi1RNbHiUjDAWz/phduQTYFbaKGx9GHLkg3yIqL6zp4HhC6XznN4gP6VjdEhnUF4pAINie4JtLBz3vgng5KAoj6O3W7BGfWc4g6GtP3OO5U28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vNSADsoU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vNSADsoU"
Received: by smtp.kernel.org (Postfix)
	id C54EBC19422; Mon, 22 Dec 2025 10:05:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91F80C16AAE;
	Mon, 22 Dec 2025 10:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766397954;
	bh=zGq4ggfr/5r3cP3TvgM/5sBKvQSbzMvvoNBA0QQ30YA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=vNSADsoUF89PpeoLNUdTnWQGG7vbJMAG9szZBOiIBVwIvEMQ3AwtJVwhnYR/Uusty
	 WBxN8i7XVKk+QPtnPGNF0/+1S58ZY9WlYg0iTW/EyPiRywdsaFvPizShvzDxXfwDJD
	 Em5Akox4RSAF4ZXMNhI3z5hjmg2QMixD/iEYvvT7f217BjzT3y0WQfpMGq1OYLL9QI
	 /uV4C4CPIEWNtFgBam/8yqnd7tonw3M8x+RP3qJ3xAfRgyCGsYnNLmjd6HtbZABCJB
	 SiHAQ5h+GGtdfcslUfss+84uEcsDCf1Usz4WA/mcwrzKPl5fhBmby3DRJ+pT77SLBT
	 n1AE/z9hA1Sgg==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: soc@kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
 Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251216191212.2879226-2-robh@kernel.org>
References: <20251216191212.2879226-2-robh@kernel.org>
Subject: Re: [PATCH] ARM: dts: vexpress/v2m-rs1: Use documented
 arm,vexpress,config-bus child node names
Message-Id: <176639795130.32569.11857070217126257109.b4-ty@kernel.org>
Date: Mon, 22 Dec 2025 11:05:51 +0100
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Tue, 16 Dec 2025 13:12:12 -0600, Rob Herring (Arm) wrote:
> Update the arm,vexpress,config-bus child node names to use the
> documented ones. Most of these were updated a while back, but I missed
> these.
> 
> 

Applied, thanks!

[1/1] ARM: dts: vexpress/v2m-rs1: Use documented arm,vexpress,config-bus child node names
      https://git.kernel.org/krzk/linux-dt/c/7dd84bbec273345bd5735f6917b93eb2a7d9c0c3

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

