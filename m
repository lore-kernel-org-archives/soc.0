Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A2249659
	for <soc@lists.linux.dev>; Mon, 15 Dec 2025 20:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765830307; cv=none; b=u48X2RU5VHiACqZyV9jcMuKu1JO6OFmgbxYtt3miKvoaVW7AM79qC3m1XXMVEb2XBuiZvfLd21eogIL6OJGqv/HUEyks7VYqnQXKXZ2Ec9lIeB2SjOayw6fst2H9jRs10OvF8bTCgONsiCWu7v+9eD166cIO1fUiFy0zf+oUz7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765830307; c=relaxed/simple;
	bh=jP5lpq2LOwmvTnRrKT+DTVLnvpu/X1E0EgAQfBfTPjM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GCawP8Sw3yBzNK6n0Zv0R61ogyxof5BZKmww+ydQKVUr96zjJkn5WXJZRR4xwyRRHgt4W3Ift81j9oFhckdEEIHOxvTNwGMJBYXUAgbelzH20jqIx4BV0VujKAnvYrNrXcqpQGEZUDZtKhfrX31hTaExw9Ihrb1fLuOT+dm7GiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V3haMYzT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V3haMYzT"
Received: by smtp.kernel.org (Postfix)
	id C9B84C116B1; Mon, 15 Dec 2025 20:25:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A621FC4CEF5;
	Mon, 15 Dec 2025 20:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765830306;
	bh=jP5lpq2LOwmvTnRrKT+DTVLnvpu/X1E0EgAQfBfTPjM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V3haMYzTwBediby/Zlpwk73gzH8c7YCuBsd+sjuPkmIE1HqQqMnVR9vx/R4CpthaV
	 4dbGA55/7yNth+KvT+zzkmCFk+3VajD697ZkE1kEsfNp1670sbotjoOEVUSTTre43a
	 /JZglQ3LC4kOnkg2s9Mm0r8AEWMg3hhJT/x+LxlOGFCHKMu9aIZVwr2jNxQ/NMZpxZ
	 ySk5U2fehv11Hnvy9CkPkMgGVVGddZRH/B84py0pnCtSarwzgjXAtmxprzMWL0It6R
	 V+a+tLqqFfDFWrwXQf1TL2YBacOuwzcVbgk+5TxYTJ1vR0bSnQO0IZ9xKoGz7fVnfH
	 bak50MNCNelWw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: soc@kernel.org,
	Linus Walleij <linusw@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: dts: ixp4xx: Fix up Actiontec MI424WR DTS files
Date: Mon, 15 Dec 2025 21:25:01 +0100
Message-ID: <176583027654.110616.5692785131178789330.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251211-ixp4xx-actiontec-dts-fix-v1-1-97af8e79d474@kernel.org>
References: <20251211-ixp4xx-actiontec-dts-fix-v1-1-97af8e79d474@kernel.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=589; i=krzk@kernel.org; h=from:subject:message-id; bh=VNvTpX+IUbbw98YtQo9u9OYa7rAUIxvWwHWSIiGXWMY=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpQG6dGZTh4EYSxcWG1fiiStGGW0Z4P53VixfgZ FFNEMwoAbmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUBunQAKCRDBN2bmhouD 1xbdD/93MMebgxboaOJNU1uqaz4LHEgiXi79N5FWPyR9ybg4CT/8ImF4vmVr63M1d/Lv47BNlF/ dNF6nP35kIRSCEBqWYJ5ZJwZAqyoOADHbbmN6l/iRO9g8TnZWR2TAFwSHxjJQ0yaCkWXnz1RzvY 8S4qXylPaf6tI88O/vFhoZ4cJOEvxIGXLTx75aYR+WZEBvo8mPHAw0yD6g+kyBtGVL2GHwVGi7I unFPuCeqqu8JdzE9dqqOtYTLTDJ/sQesNO8R856tSXBANRgjHPXR0dLHFmVMbaizsttAWISsNPy elYRuXk28IPKQZFgXju4m+9+vxhP5/GhC2VKvuqeE5EqpBylcy+csYZ2Fak57x0FWC1CEIz0J+w skfdMcR7w5i6ygtFk1jZ5K7c60XBhm+u3ldykVY1OLEVsVcTXlJRein44IG1sCUv+I9mbTDrfl4 QAriUvHX28hLnMd8xuszjKvEgPbXgORx7hmS3MVplCrQEdRG0EpunTv1CgXSP++ESuLerwfWae7 0ltJCVMe3vgGISjyASTBkxXGnd9hKH/1+uIsuda1ANIUQrsMcM8MO5s9xdzk1fQFQFwGaWNI2gy ZAgu/PV0wiGboDLhUyfGziUhSgEVaFcFl5CGX/anIvrQqHbtqfKox6ppA2rkIbyNSyQKqrg0sOj laePeDGTL9mGhGg==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit


On Thu, 11 Dec 2025 14:05:01 +0100, Linus Walleij wrote:
> The KS8995 switch was unconditionally wired to EthC (eth1)
> on both MI424WR variants, this is wrong: the D revision has
> the switch connected to EthB (eth0) so pull this assingment
> out of the generic MI424WR DTSI file and make it a property
> of the respective variants instead.
> 
> 
> [...]

Applied, thanks!

[1/1] ARM: dts: ixp4xx: Fix up Actiontec MI424WR DTS files
      https://git.kernel.org/soc/soc/c/ececfba255bf3616301419e47a5c824e04b60ab8

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>
