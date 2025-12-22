Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D015FDA7
	for <soc@lists.linux.dev>; Mon, 22 Dec 2025 09:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766397423; cv=none; b=Xv0YhxYZ1UYT1/iHj/3rc1Sw5jIs5ihuJ4OjpxrEeoj0ErebtPAq46i82mulUxlbb0rGhgfyTY55obi2ssPoeDnpA2IbC6zbwNefR/lOsex16FPGRt7hFezSVrvBnlf7etxqWcNjHWCP2n4tryEeqstyYtnA+e0JIzBVI9IZ9ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766397423; c=relaxed/simple;
	bh=CYmiWxroTeuGX+wvyMr/3M+luTzSTpeh/V3eQgu9idM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qS1jRVE6qYfmtwoPHin/82y87vok5SwEdjl7RFvZg/pCbrj3qPcUXPDWp4rnRYur0jKAqWFsHU8xgLkKCHBznBOPM/mnpeEFpItoZPR48uwmj+O25Z7VgGfioUGBUE8U0JIrm5gyTkRpZ9MpnVFKIGHf6S8q+TTBGubypzmfbik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L/mWXNof; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L/mWXNof"
Received: by smtp.kernel.org (Postfix)
	id 95730C19421; Mon, 22 Dec 2025 09:57:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2939C4CEF1;
	Mon, 22 Dec 2025 09:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766397423;
	bh=CYmiWxroTeuGX+wvyMr/3M+luTzSTpeh/V3eQgu9idM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=L/mWXNofGnUxm66rtK/PbCodBYTcbvO1fquMVMqV+YqXV+Pu3Ix63AkE/k8yGchQ4
	 tLCy71rCNXUDZ0RhrPxmqEUj8eKlV5unDQPZ4ok4MqgaZ3DYUPXFSXDxUcEplgUXPl
	 eob4SZwVIglL615r0yD8Tg5mwD4EZHJbmenOsHVocloKMGdmzazSeR2WuFNuXPQhX5
	 W/xIHIJKHz7cQyDe3kSWd4xxH+2d9FeUWhapaLXtwh/o4jCRoNXuCg4Ww7wPmB3+8f
	 ta27rdJniqF4FdMAm/TC4ACIKU7WFx7D8fNyXeDQ55mhzgyYhsHieQMuSOe0pGNQ/y
	 Ur6wS97+3m48Q==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: soc@kernel.org, Linus Walleij <linusw@kernel.org>
Cc: linux-kernel@vger.kernel.org
In-Reply-To: <20251216-maintainers-fix-v1-1-92f11231b27e@kernel.org>
References: <20251216-maintainers-fix-v1-1-92f11231b27e@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: Fix a linusw mail address
Message-Id: <176639742232.29718.2937743508114738336.b4-ty@kernel.org>
Date: Mon, 22 Dec 2025 10:57:02 +0100
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Tue, 16 Dec 2025 10:40:42 +0100, Linus Walleij wrote:
> The patch adding me to the SoC maintainers was in-flight at the
> time I had to change my mail address. This fixes it up.
> 
> 

Applied, thanks!

[1/1] MAINTAINERS: Fix a linusw mail address
      https://git.kernel.org/soc/soc/c/c4c6db7ac54649c0cfe7d86b4a5358296dc8d08b

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

