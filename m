Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9805215706
	for <soc@lists.linux.dev>; Mon,  9 Dec 2024 09:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733737739; cv=none; b=lQplfBN1hRBKN7dDG7VEN4s7WfBsJGLZFWhXUQCrXlnXXyDOX7i7kbExYShpj8j28GwQXD+OsAJJNyc6S8Bh9j80vv/ZiyGXvc899xfBD5eqMmz8JcWlPW4KR7Y3I7Ix5h5w3IW/tNBUH5BtxiMN5y3nlmP0Hc/p6zLfSx7Ee1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733737739; c=relaxed/simple;
	bh=U0CufWdAaA6Me8Q0Og61NZHfw77qNzDNc3cWfEPpdZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tEM/DJiQF0HVNWnFTDoPafDqfIEBkd4OlYP05UbT3p5BQY5JcXbFBzsNe2MesKTD16JBd+0i3GNZxMuZqIpe61jZu6ZkB60lxRpaXcFTQ2/Nm0EBlMDRe3DdVFaiHyTbMYkWIDHi+ujHiTavfBg8iNba5bZOPsDnQ20UW96Airc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rhH4UrUL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rhH4UrUL"
Received: by smtp.kernel.org (Postfix)
	id 90692C4CEE3; Mon,  9 Dec 2024 09:48:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 346A9C4CED1;
	Mon,  9 Dec 2024 09:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733737739;
	bh=U0CufWdAaA6Me8Q0Og61NZHfw77qNzDNc3cWfEPpdZA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rhH4UrULssmgCqsspl3KJzRUsXeB8VE3f/jZTl9Clb9CSlLpM4aCumCH0Pm9KNSOy
	 AZGNhXgOvL1tMbpmSteqJV7ISBUOCJFgqewmU4F7zpyX6gD76sMFhLvi2ca9bha5J/
	 3Yi2+oSBfOfoi0liJffY8vqo+oYdzUGBx/aTw23ndad3E3fNNl19IdVW4+X1tp96zw
	 IMl1XaO5rVYZPpi6ksioU/eoPHdVXhfhxLE93OmnnaveNtDVgjYeEEbd50WkxPqfKU
	 AgdnXIoa+Gw6W3MiJ9mYgtoNg5nigWTz6vpEpDfw5UTRdHlH5cvRzZwWrfMkEixUuz
	 8cFPkfbPC+Exw==
Date: Mon, 9 Dec 2024 10:48:53 +0100
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	arm@kernel.org, Andy Shevchenko <andy@kernel.org>, 
	Hans de Goede <hdegoede@redhat.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH leds v7 00/11] Turris Omnia LED driver changes
Message-ID: <sn4jz4tqo6cywpg3vwugl4heh5qt7e2uhmvvnu3l2cf4jj22af@azybtpl5bm63>
References: <20241111100355.6978-1-kabel@kernel.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241111100355.6978-1-kabel@kernel.org>

Hello Lee,

will you be taking this series for 6.14?

Marek
