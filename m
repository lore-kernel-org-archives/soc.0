Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6917727FB1E
	for <soc@lists.linux.dev>; Mon, 24 Nov 2025 15:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763997409; cv=none; b=WpnU1kwa5DgdNOHI/pM1euJhggyPEVNKGttmhRFo85nH4ngDEhi/iiSOWxRkdCqAKsTRmevikKLX8Efrnjk2Lc7dDUr9ObxVljxQKbNxRjERp56U5szIuGa9I5rGuoK35wAsOWvbL8gDO7MKgyQ7fTceU2zQoQCn6iglGpKWnh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763997409; c=relaxed/simple;
	bh=d2EUVNi4/iWeBEuH0meFYTCMjfrD57PAEqNQA637UUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sPCpKiJ7j2Symi/fHau1PoxBvWZS4PtbrGQ3+MBFYFC88ZeEHw+WYKkVblbTKq64s5CqhFAjIGDUMrJzNEGfCd2i9GsBZK1lyXvhzDrNWnCS729h8NSLbrHuE1Mm+FtkLJGRbO9nWn1IASl8Kunk5S5hsm2iR/qHpcq7oNzJGDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 50455497;
	Mon, 24 Nov 2025 07:16:33 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2230F3F73B;
	Mon, 24 Nov 2025 07:16:39 -0800 (PST)
Date: Mon, 24 Nov 2025 15:16:35 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: will@kernel.org, Huang Shijie <shijie@os.amperecomputing.com>
Cc: patches@amperecomputing.com, cl@linux.com,
	Shubhang@os.amperecomputing.com,
	linux-arm-kernel@lists.infradead.org,
	krzysztof.kozlowski@linaro.org, geert+renesas@glider.be,
	arnd@arndb.de, linux-kernel@vger.kernel.org, peterz@infradead.org,
	soc@lists.linux.dev, Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH v2] arm64: defconfig: Remove the redundant
 SCHED_MC/SCHED_SMT
Message-ID: <aSR206S6V3-EaDfp@arm.com>
References: <20251021075704.527626-1-shijie@os.amperecomputing.com>
 <176357945539.2095097.9737276524353571173.b4-ty@arm.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <176357945539.2095097.9737276524353571173.b4-ty@arm.com>

On Wed, Nov 19, 2025 at 07:10:55PM +0000, Catalin Marinas wrote:
> From: Catalin Marinas <catalin.marinas@arm.com>
> 
> On Tue, 21 Oct 2025 15:57:04 +0800, Huang Shijie wrote:
> > The patch "7bd291abe2d sched: Unify the SCHED_{SMT,CLUSTER,MC} Kconfig"
> > has enabled the SCHED_MC/SCHED_SMT by default for arm64.
> > 
> > So remove the redundant code in defconfig.
> 
> It's usually Arnd picking up defconfig changes but since it's more about
> core features, I queued it.
> 
> Applied to arm64 (for-next/defconfig), thanks!
> 
> [1/1] arm64: defconfig: Remove the redundant SCHED_MC/SCHED_SMT
>       https://git.kernel.org/arm64/c/a086f211a3b1

I'll drop this as Arnd already merged it.

-- 
Catalin
