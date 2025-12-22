Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9252FBE1C
	for <soc@lists.linux.dev>; Mon, 22 Dec 2025 09:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766397536; cv=none; b=cTehw43W/CQr26viRwow169J2KAK5Cuf0lYkY3+/rgueNilxzUP/KWLyqzo4TrBQ7Zgvvf86qnekqskbct52mZHWlR5aodKlaVC8v17Ay2IKnDpEfgEMDKmHE9ruMxRd5dGC5DXsaCYwxjYc3FtwQ4IYlLgL8dVQeNTxgAWOrog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766397536; c=relaxed/simple;
	bh=8xhaDtSjXOSgRrUdLRpzbBVsMJ6bbqn9dV31CeS8RPk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=guoJjjMf9712SMXpC+CxI1qf51JVhlvE6Eo51fM262myRqLJ59vQqBa0AaZmNSbmceB8aJzwJ7vHNeKuo31FRpWahJK1sYKSxJIfGxfNC2zYv/TereaybxFwI6P4riLwaPB2wzE5hkzfg8HUkmc15PMm9qqVLhodFZ9POy9Htiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IcQExJiL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IcQExJiL"
Received: by smtp.kernel.org (Postfix)
	id BE6FAC116D0; Mon, 22 Dec 2025 09:58:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABFECC4CEF1;
	Mon, 22 Dec 2025 09:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766397535;
	bh=8xhaDtSjXOSgRrUdLRpzbBVsMJ6bbqn9dV31CeS8RPk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=IcQExJiLestmYEqXaLFKpPDrkmen39A6xVBakQOZ9Sv3KzUpfATq0hzwnfi3N7R76
	 xaS6/HM1ujZBKKVBr88DCgk+dxnHx+Vf+tbYv71GDgZFQWQ5UU+5WlvPP1PcWZqSfN
	 WU/Vq42SxbHikQe+Vftto3WL+fxAcIr2jDkpGCywLdnvVvrkp/XR1uIRrXsWUNDmzy
	 ZLQhNtDAYlLOI2UHDbwtq46KHkgu3DKLGtwCMTwO9Zq6GCDCqh8DzS9wlnsZltGOaI
	 ZI1fEbfnQ5zCsuf9Nbvjh7aEaHqAYkkVv6rYjjNDOFaUt7rgu3szYL0iJGk9YjxE99
	 9/jsNM2DUJu6Q==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: soc@kernel.org, Chanho Min <chanho.min@lge.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251216175951.2791921-2-robh@kernel.org>
References: <20251216175951.2791921-2-robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: lg: Use recommended simple-bus node name
Message-Id: <176639753214.30319.18070408035908204137.b4-ty@kernel.org>
Date: Mon, 22 Dec 2025 10:58:52 +0100
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Tue, 16 Dec 2025 11:59:52 -0600, Rob Herring (Arm) wrote:
> Update LG LG131x 'amba' bus node name to 'amba-bus' following the
> standard names for simple-bus nodes. Generally, node names and paths
> aren't considered ABI, so it is safe to change them.
> 
> 

Applied, thanks!

[1/1] arm64: dts: lg: Use recommended simple-bus node name
      https://git.kernel.org/krzk/linux-dt/c/30ae13173704585f2a3f406e94e0dbaa5cfde69a

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

