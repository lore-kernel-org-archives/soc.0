Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D0B3101A6
	for <soc@lists.linux.dev>; Mon, 22 Dec 2025 10:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766397951; cv=none; b=P7vHCWgaIQubMSljMshPw6N+gBUvm9Yk7dQjOw/QKhnncyeo0m4yAfGNEtimEtvvS6R6I65mDmufPo/jfEqVFPDc8ndb/ULaBSzux9Hcn8N9jfE5BuZ/q2Oi6B7XYk0OxCjJ11nkxSHYYLBvt1c8IJ9BPj08BvoIoB6omwjqPRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766397951; c=relaxed/simple;
	bh=eBp8Cc57MU5RftAs6kSYu4shOivUqtmkwBkQrbiSaI0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Rf+fumWgTVQ1R7LmCj+kGbCcntvmHSwKXiQq6ZWfsUCoz1Ps92DRx3gAdiTkhvHQmXkXbZh3KOCvnu51taeFspPThpyKj8ACWX7gb7hhSUlo2yWfjJcJpUmPTTXvPCSKQFIIVTIj/l2H7p5c+FSL4W0ARnBp+3h5LeHn5FmnNoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YMMQr/0f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YMMQr/0f"
Received: by smtp.kernel.org (Postfix)
	id 30731C116D0; Mon, 22 Dec 2025 10:05:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 957C3C19421;
	Mon, 22 Dec 2025 10:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766397951;
	bh=eBp8Cc57MU5RftAs6kSYu4shOivUqtmkwBkQrbiSaI0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YMMQr/0fvFjJ8kOa38x8u+1SVw0sG+AAit9/9zD8OZxl0E9dNBO6X2zAl+kT8z7wT
	 f4cXJ9s1vKHt3N5+6taATT0rUa4T0R8XGza5PMuZHaMXEhMxZsaPN9hnFVECGHn5nw
	 3rGbmjtJwmJ4/GhRXi/mMY0VLbfAPrN1dK+MI+P8Di0FKRSxjXqt5t+sUkPr/bByUd
	 iO4mTJdjEObki3bKUdy1+ZKF1uopcNaCpcDnDF3yM1mhplkjBVLZ4JPPmTtSgx7rjy
	 843qWCTVvXM16gWUwMrd1VAxSEIwq4bbNZ8t4EGYb6uSqdY8//tuNBtYMQW7Y4HUSM
	 xjZWQPyvpDJLA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: soc@kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Richter <rric@kernel.org>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20251216180202.2794695-2-robh@kernel.org>
References: <20251216180202.2794695-2-robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: cavium: Drop thunder2
Message-Id: <176639794821.32569.10955263518261221529.b4-ty@kernel.org>
Date: Mon, 22 Dec 2025 11:05:48 +0100
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Tue, 16 Dec 2025 12:02:02 -0600, Rob Herring (Arm) wrote:
> The Cavium thunder2 DT support
>  is incomplete. It consists of 4 cores
> (out of 128) and only a serial port. The thunder2 specific drivers in
> the kernel don't have DT support either. The few remaining users of
> this platform likely use ACPI.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: cavium: Drop thunder2
      https://git.kernel.org/krzk/linux-dt/c/f25aa20e92305c7ab7a6387b8ef7b6e83f8a49fb

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

