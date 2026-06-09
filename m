Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6630838E119
	for <soc@lists.linux.dev>; Tue,  9 Jun 2026 10:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781001737; cv=none; b=eQ1qbLFfL0TCeXFjRSV0BNhfVbdmHR4kNS1CGDOnghCQSYZ1+U5O8/dc6JDqTrWMMWjOWee8GvJ+W0+Bvs6yPvnTHRjoJ3Z+4Rt20J7qWg/21izc+iaDtsVsAgQTF9D9EYyFUVymfCh8659rceWUPNfudonXQiAuEdnyH2Anui0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781001737; c=relaxed/simple;
	bh=OZSOBqcLm6CxMIml03x+dCI25xUNRMPkAxPq1qVuUgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sbb86ULgoTofrnGuMEb1XQkbAwsKOtG7n/MAvcFYBDqmjNq6CjmfnB1QkOwNHwEp5Si1qDBtXNoDQUmMdRcxQXEb2lv0minYNCM8WnBSJt6kgnru559HxUBy8wsveBIdHHu68rsZNVd4KKvxMNmw/vb2I58ZTRNVTj2uNf71q+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E2Tcu9KU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E2Tcu9KU"
Received: by smtp.kernel.org (Postfix)
	id 053791F00898; Tue,  9 Jun 2026 10:42:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7DAF1F00893;
	Tue,  9 Jun 2026 10:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781001735;
	bh=cCiLXcWuJfatr1OmxZs97SJjzEizLGoaLacwwE8YyJk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E2Tcu9KUZCuwzRp9i6Ivi9wlJZH5ofQfr5XYJHwvKMMQcM8RZqYEP2OiRwTisM15e
	 wNxadimCrnZ9fU8RgF/yLk9pRL0xnNE/QyHXyemm/bVSo2xaq4c0RaH4sN5vvh5kOH
	 nW5ybrfpMBCTbGnxshTQeNZztSsn00Bn9T73gr9XO07LbazGH528UyKoc1plSGSCAw
	 E0ajqBfWzsCGI1qGr8pyeKMyvWCFO0LQqBHJ6wPsNX1gKDpmokRocvL8NQy5Ep2POS
	 WuLk5D6G83FaS2ivAuKl1FHwKzxgxskUn8RZu+FB46MpeMUvE3ZzhIAXgNIkZf1QP2
	 cz0aUCIlspVmg==
Date: Tue, 9 Jun 2026 12:42:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: arm-soc <arm@kernel.org>, soc <soc@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, 
	matthias.bgg@kernel.org
Subject: Re: [GIT,PULL,2/3] MediaTek SoC driver updates for v7.2
Message-ID: <20260609-meticulous-abiding-beetle-5d75b1@quoll>
References: <20260601091225.5223-1-angelogioacchino.delregno@collabora.com>
 <20260601091225.5223-3-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260601091225.5223-3-angelogioacchino.delregno@collabora.com>

On Mon, Jun 01, 2026 at 11:12:22AM +0200, AngeloGioacchino Del Regno wrote:
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> 
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git/ tags/mtk-soc-for-v7.2
> 
> for you to fetch changes up to 7d462de9f65b002b439b1b168bf3b5579b0de48b:
> 
>   soc: mediatek: mtk-mmsys: Restore MT8167 routing masks lost during merge (2026-05-11 11:20:48 +0200)
> 

Thanks, applied

Best regards,
Krzysztof

