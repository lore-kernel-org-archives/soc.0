Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F2430E852
	for <soc@lists.linux.dev>; Mon, 22 Dec 2025 10:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766397727; cv=none; b=oSVcUvnAdJ//9jULOXNmz8IFAT9mzQRNEBDbn38tkhNUZuGd1LTzhR6tEND7qMeUJhGCX/4xpVrB6OmMVlIWoRoc6m8kF9DaC1Tslv/YUTM4jBUrZwFMYE9RAKKPOoA3ZfT4gi65LbyTqZtsu9MXQ6bHG/HBTdJIEc3tln7JKUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766397727; c=relaxed/simple;
	bh=n1/yuiAnVsAmCFPgMru6RgX6r8QPzwyjLtjdTdEgdOk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GU2bFTUjvXwNcsTmMY9m6O4+y8jd5G5aJBGS73zFMEZpeXDHp10ZwuSRgJrsGM3nZYG7dP3OlImRM47/iJiRRxHZJ8jmMo2HcUsVKreccTRImpIRsRD4arw8/xCHuufxYJRbJROQMDRoudmwhKvFLkMfnYeGnKkpJ1pzR1y/Ec4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BBLzC2Fi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BBLzC2Fi"
Received: by smtp.kernel.org (Postfix)
	id D2A23C116D0; Mon, 22 Dec 2025 10:02:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 601BCC4CEF1;
	Mon, 22 Dec 2025 10:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766397726;
	bh=n1/yuiAnVsAmCFPgMru6RgX6r8QPzwyjLtjdTdEgdOk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BBLzC2FijLYTL0ZkjnfodrhwJAsq0ABTMVNcbLqj1J+R9XSEHRsP4hqE/ypwaMW4V
	 cYF+dhyLi46PCV5zwhglbd2sbgNQSDmIjQxO4/JVITdQDC1R0Fgt5XC/qi84R50YlS
	 SFQqLiBtqNLCudUOD58WSk/EPsuY4r9tdc3hpB8WY6k/yIoRW5FTxfIUItTuW+kwbo
	 M7StzmqgI7s6MD00h3YZ36VUGRuWXjMi1R3dlMLoX7maWd3ehP0l67THjtehxMix86
	 pAA9sqO3L+N5oFjz1z/8gw+TkEw3lKP/U2kdwr2Khgr5fropZmOMPacGnJH7if9iCX
	 CWYdXQu1Na/Wg==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: soc@kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251216180029.2792676-2-robh@kernel.org>
References: <20251216180029.2792676-2-robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: sprd: Use recommended node names
Message-Id: <176639772400.31420.3898753067946211850.b4-ty@kernel.org>
Date: Mon, 22 Dec 2025 11:02:04 +0100
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Tue, 16 Dec 2025 12:00:29 -0600, Rob Herring (Arm) wrote:
> Update Spreadtrum platforms node name to the recommended standard node
> names. Generally, node names and paths aren't considered ABI, so it
> is safe to change them.
> 
> 

Applied, thanks!

[1/1] arm64: dts: sprd: Use recommended node names
      https://git.kernel.org/krzk/linux-dt/c/714b5a789f957871f18433645aa39d9109f194fb

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

