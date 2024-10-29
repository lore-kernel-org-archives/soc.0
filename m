Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DAA020695A
	for <soc@lists.linux.dev>; Tue, 29 Oct 2024 13:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730210224; cv=none; b=MnGZyWptfwZaI6uXFqm0+f3Is2nET1vmxEeQC25svYi94kgo2AIrhafDHNFYDYG66E2RSNbiq4ZW8TUPdd/FgI9RurYhOgs2YixGf2sGO6TejMITjWT7ZaSdp7X14o5vAeank2/oKdfT9LYmyniThC5XkDfP0eqRDfsia0Ju+TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730210224; c=relaxed/simple;
	bh=8xxaLaeqEAFIPs2iLJxr0JwGVdVOwPrRyzlBgb3dEzU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PVLmmpMZAxw/hS2F3qFBHmTYqG1i78hMUWdVDC9jZozt6LkrW2PLI5ZnzWqw+b/pBop3Gjc4aDXyPICs0RVdjNVmgPrkDjptnfLB/VQ9VPP76ewrbBoSThor2iiU2mjctJuH6PhMcdsfjTGybpTocquApgetbf/I6Ej+S0XmW2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=txd4ZATU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="txd4ZATU"
Received: by smtp.kernel.org (Postfix)
	id 90432C4AF0D; Tue, 29 Oct 2024 13:57:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AA6DC4CEF1;
	Tue, 29 Oct 2024 13:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730210224;
	bh=8xxaLaeqEAFIPs2iLJxr0JwGVdVOwPrRyzlBgb3dEzU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=txd4ZATUmkVgcfssV3MltLERVxSDgAMZ2Y+lxSzZa3S2hV5JheIzHsfoon8HN0jF5
	 COA3Wx2HidN/cyWiHPue6v8RPgFiPfZ1SNi9BEPon4LvWl8nLT3wc2eP/AydaikD5l
	 PymDmNFjKegAMACjHVv9n3NSjOTsB65bsYnshIFnLJpLQCeuvQy8jZmiU8bwTvb+i/
	 xmSkTHvmG4UYhj4WSf+a8NYu4wlJa3OFlGJf/3gC0DevdN/vIiXJusFPqeGIwNJO6p
	 VBzW0bvbIAk9jXbIRtJ7OTVp6Gkc5mWlypWmWOfhRBJ3kfQLFzh1zNIddo9tRZd+vD
	 QG0IKbN05MGvw==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>,
	linux-leds@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH leds v4 08/12] platform: cznic: turris-omnia-mcu: Inform about missing LED panel brightness change interrupt feature
Date: Tue, 29 Oct 2024 14:56:17 +0100
Message-ID: <20241029135621.12546-9-kabel@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241029135621.12546-1-kabel@kernel.org>
References: <20241029135621.12546-1-kabel@kernel.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When reading MCU firmware features, check also for the LED panel
brightness change interrupt feature, and suggest upgrading the firmware
if it is missing.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/platform/cznic/turris-omnia-mcu-base.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/cznic/turris-omnia-mcu-base.c b/drivers/platform/cznic/turris-omnia-mcu-base.c
index bb871226e357..3bb4a3cfdb29 100644
--- a/drivers/platform/cznic/turris-omnia-mcu-base.c
+++ b/drivers/platform/cznic/turris-omnia-mcu-base.c
@@ -258,6 +258,7 @@ static int omnia_mcu_read_features(struct omnia_mcu *mcu)
 		_DEF_FEAT(NEW_INT_API,		"new interrupt API"),
 		_DEF_FEAT(POWEROFF_WAKEUP,	"poweroff and wakeup"),
 		_DEF_FEAT(TRNG,			"true random number generator"),
+		_DEF_FEAT(BRIGHTNESS_INT,	"LED panel brightness change interrupt"),
 #undef _DEF_FEAT
 	};
 	struct i2c_client *client = mcu->client;
-- 
2.45.2

