Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C350F30C600
	for <soc@lists.linux.dev>; Mon, 22 Dec 2025 10:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766397730; cv=none; b=fFZ7gmHREOoNwiiRNlRVxpniF2PmIujl3fpUjtot3X2q7gmvIAjin8Y6P8WDEQIPeX3HRIJRBX4axhl//V9MKfzHX+4HcPVz1vsDZmR91egyjpY1O3oDJMVGLOX++Wc/QsgoWm6niu9v/anvOkJIbLNxLdErotKksHp4AG+rCL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766397730; c=relaxed/simple;
	bh=rFDFoU7W0N6i/K6WZlv3Euk+Qwss6Rke6zV6jwkns94=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hyCCLT88CVpOxu/s/uvgokjvgUbnijTbqtjFPsXyWyk8Vk4cgN4x2cGtZD1TfuWojIBnqfP4n2XqjeKRPNrDC/2SkdrBBBIFssDC0WiSUBF0bjN1Ra7JFb6PGnkehWokWFjKdrtvgVzRGloyq6BTJZ+06tnJ1YO2ZKNjnPFUyT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h3n8B0Gc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h3n8B0Gc"
Received: by smtp.kernel.org (Postfix)
	id B7A41C4CEF1; Mon, 22 Dec 2025 10:02:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69AF6C16AAE;
	Mon, 22 Dec 2025 10:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766397730;
	bh=rFDFoU7W0N6i/K6WZlv3Euk+Qwss6Rke6zV6jwkns94=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=h3n8B0GcwOwrEEuevWY2gH95coluf18Sdd4ZAnaytzJoiNpItO+UtayaErOhsoOtB
	 MxRxcDesm01E8cLyRD9khYKbpgBSVjOd669wySRauxhAOgOXukFruBMF4AUsJRJBsr
	 MDxeJu3DVQkOzMdBPuQkuvREJTmsQcDYhmb1/izo4GivHhWMoKTnRb//lwvbTCAXnJ
	 1kPm5n/ejnB5oACkBURpF94kTK/f6CkE7l1x5SmAKj4NtUu8ceDesATMDa7mMNG9Fz
	 9EVTxRt67WkrXkeQSU5a7TDmbxlca0Qyu0k62krikesKCE4UZAc0CSadCrxwedjgyB
	 5Jr1XOz4KsQHw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: soc@kernel.org, Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251216180055.2793215-2-robh@kernel.org>
References: <20251216180055.2793215-2-robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: toshiba: Use recommended node names
Message-Id: <176639772702.31420.9343688718392781751.b4-ty@kernel.org>
Date: Mon, 22 Dec 2025 11:02:07 +0100
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Tue, 16 Dec 2025 12:00:54 -0600, Rob Herring (Arm) wrote:
> Update Toshiba TMPV7708 node name to the recommended standard node
> names. Generally, node names and paths aren't considered ABI, so it
> is safe to change them.
> 
> 

Applied, thanks!

[1/1] arm64: dts: toshiba: Use recommended node names
      https://git.kernel.org/krzk/linux-dt/c/22fbe6e21450d629642e4bdc8d8d329219abeb46

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

