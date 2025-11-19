Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FF31DC985;
	Wed, 19 Nov 2025 19:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763579540; cv=none; b=iMHAahzJ1VEBMR2xk3BVSimuBsORgN2XXryDnPC6aSyL6CUgeUihDTWPGp7GgWdqeceRgIAVlBz8gI4InrchrdV8cQ5sSTQED0Lls0Bnl8ln3exwmN4eSmIVe6Xzv209kta8bssnswlctA8KEs1bIAPuuxmoCihEliNG3GmS/AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763579540; c=relaxed/simple;
	bh=IKAlcYGTKdJXVFZdjwTp/BjIGSIhrX8hMQqbZOGJqM0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kPznulRgMtiFDvsyrKNnJhjXyOBAayXHvJZCczEfGMTEDwjm269zFGxhULw62WQhW39MJlcgulBKxZT8oE2zYOSmJ4h1eB3ps5n6OwsCo1mDBlFp8ufSl7GIECMz/eVqjUypdYjkFfNrqU1SctqTjf72eVA7lV4cShtckBb5vgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tg/soZym; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tg/soZym"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DB98C4CEF5;
	Wed, 19 Nov 2025 19:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763579539;
	bh=IKAlcYGTKdJXVFZdjwTp/BjIGSIhrX8hMQqbZOGJqM0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Tg/soZymer9O+wnKEmzv77mKDYj6GwA+JijOhY9gG+zR00pB2MgkkDM897KFbquM3
	 prPdtyogNJ/tnCoRh7gsWNvmPeRVDnURUN9OgUdrImcDWcvm/WHwui5dhI26hAFoKS
	 qsdeLUU4A8rES/F1aSkIn72nsLga/VUCRqF28ni+4Shxa3MuE1RQ/kma2JO+t3MFb/
	 kWqDnyzIOtHjkqRkn4pETqB8iji6nuHDniZ043tf/h9Upo+cuv8Bzl9Nx1PA2ZeexO
	 WqXLMyzLZpnrKswkVSkNSUjkOowwgIVLx5U/irTothpvYjw4+fSN1P7NsYnlXhDls+
	 rdj7pvDGzEb5w==
From: Catalin Marinas <cmarinas@kernel.org>
To: will@kernel.org,
	Huang Shijie <shijie@os.amperecomputing.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	patches@amperecomputing.com,
	cl@linux.com,
	Shubhang@os.amperecomputing.com,
	linux-arm-kernel@lists.infradead.org,
	krzysztof.kozlowski@linaro.org,
	geert+renesas@glider.be,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	peterz@infradead.org,
	soc@lists.linux.dev,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH v2] arm64: defconfig: Remove the redundant SCHED_MC/SCHED_SMT
Date: Wed, 19 Nov 2025 19:10:55 +0000
Message-ID: <176357945539.2095097.9737276524353571173.b4-ty@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251021075704.527626-1-shijie@os.amperecomputing.com>
References: <20251021075704.527626-1-shijie@os.amperecomputing.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Catalin Marinas <catalin.marinas@arm.com>

On Tue, 21 Oct 2025 15:57:04 +0800, Huang Shijie wrote:
> The patch "7bd291abe2d sched: Unify the SCHED_{SMT,CLUSTER,MC} Kconfig"
> has enabled the SCHED_MC/SCHED_SMT by default for arm64.
> 
> So remove the redundant code in defconfig.

It's usually Arnd picking up defconfig changes but since it's more about
core features, I queued it.

Applied to arm64 (for-next/defconfig), thanks!

[1/1] arm64: defconfig: Remove the redundant SCHED_MC/SCHED_SMT
      https://git.kernel.org/arm64/c/a086f211a3b1

-- 
Catalin

