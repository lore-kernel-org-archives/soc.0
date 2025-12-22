Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2903A30F529
	for <soc@lists.linux.dev>; Mon, 22 Dec 2025 10:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766397948; cv=none; b=nooghslDwkkQB0pR5OiOCRZXDMtz15lPfD7MOzcKhXQXn2PqpbtIYQzycV3WXMloXMFZzRIEyinqI//vlDvIcmkARtEA8TEBFch/Q0rfx1BaiZXLM0woCpKJqfi3ypgi7nG2So+LRUdpzmXqYzXqxbRDUyxtb224QwgVVf0NJGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766397948; c=relaxed/simple;
	bh=KWxYkfliE2cEK81isi7dy3wXoxti9iaQaTnKM3nDUPU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oA0Y7xTffjcSFBcra0GrLlGBxE/1Jwh+vlWnG2/QrNifw4Pa0FiPWy1FiR1ws4CTA7SWo9WOlyESPjSVfCZTlqEybFvcg7LdCOIg7nguOQgRg5jlPBIJqklKoUwyF4ubIEInEBONBIK3+obCyIU8fVzyOmeceeLannRvDiyC1EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W2NAQm8m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W2NAQm8m"
Received: by smtp.kernel.org (Postfix)
	id F3050C19422; Mon, 22 Dec 2025 10:05:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB978C4CEF1;
	Mon, 22 Dec 2025 10:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766397947;
	bh=KWxYkfliE2cEK81isi7dy3wXoxti9iaQaTnKM3nDUPU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=W2NAQm8mfcieDQngBW/IZdlsWLdt/CtmflxwfEzyBLm7IgqDRK8XUM8nD32Abu0am
	 otb+5OXuynpmXC02lHndzQu/ESGZvF3A9m0TBdOX/0J6QmCFF0MCneM+4czmIoEZA3
	 y+sTULnCJLz0RBdbQo0DFAllZ83DXmH4aFcA8PESxF/1Vw1CDaZRjVi6Iko0zilu6n
	 Bx+zBfg5Ee1gk9R4aOgDAo3XQK9TGFKLuHSst41PPhcz9snWcNw7xrzPcFJI2DFhjQ
	 MLS4DNrn1U+8W/VTN0mBfHKjpB/WFEMVkOFWZXc9mTqOwJV6KA7klwFo/Fi57G8kJT
	 CjqxIRytsT7fg==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: soc@kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251216180136.2794105-2-robh@kernel.org>
References: <20251216180136.2794105-2-robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: cavium: thunder-88xx: Add missing PL011
 "uartclk"
Message-Id: <176639794552.32569.16156019115295527281.b4-ty@kernel.org>
Date: Mon, 22 Dec 2025 11:05:45 +0100
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Tue, 16 Dec 2025 12:01:37 -0600, Rob Herring (Arm) wrote:
> The PL011 IP has 2 clock inputs for UART core/baud and APB bus. The
> Thunder2 SoC is missing the core "uartclk". In this case, the Linux
> driver uses single clock for both clock inputs. Let's assume that's how
> the h/w is wired and make the DT reflect that.
> 
> 

Applied, thanks!

[1/1] arm64: dts: cavium: thunder-88xx: Add missing PL011 "uartclk"
      https://git.kernel.org/krzk/linux-dt/c/15e3ce53673289624bab4e6a60207af4775f4a38

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

