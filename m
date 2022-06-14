Return-Path: <sboyd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29FAFC433EF
	for <soc@archiver.kernel.org>; Tue, 14 Jun 2022 19:26:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DEBB7C3411E; Tue, 14 Jun 2022 19:26:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B401BC3411B;
	Tue, 14 Jun 2022 19:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655234782;
	bh=ZxFls50/MvoVFmNjUJPqAmiE889LsxObznSRc1AMjcU=;
	h=In-Reply-To:References:Subject:From:List-Id:Cc:To:Date:From;
	b=C88iAXuRDy4LiYlY5IODU3MWH2rM4wgW3DiEehtASGqCt41ShwiHbwFUZq8K1wd8X
	 JcNeYEzJhNqbT9a2K85Z/LdN3HxXhYYU86luGug1PYbfVMK1gQanNO4fvIHhjrv0oy
	 yZwiuyHU1d0bxWqKZ9UwKwKYkAwppnE5N7uJpr6ZPJ4LxHQazPTI2s7ssBT1LK3tcv
	 M7ogO+bgbuUhHtV2dzrupnhP7yATe2PuRSmcZxnmO8vKRTvwr3mVjIRQLVvVIyehYj
	 Vdp6Tdn+1yAI6Lbk6iGcjAFm+W/FSqGK8w8uWdfKKR9Kj0oyA4QQe/cqeUm4xU6Llf
	 f0miHGe0pcUpw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4c096a22224e0ba6fba113c172cec45ed705aa47.1655194858.git.qinjian@cqplus1.com>
References: <cover.1655194858.git.qinjian@cqplus1.com> <4c096a22224e0ba6fba113c172cec45ed705aa47.1655194858.git.qinjian@cqplus1.com>
Subject: Re: [PATCH v18 04/10] dt-bindings: clock: Add bindings for SP7021 clock driver
From: Stephen Boyd <sboyd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, mturquette@baylibre.com, linux@armlinux.org.uk, arnd@arndb.de, olof@lixom.net, soc@kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Qin Jian <qinjian@cqplus1.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Qin Jian <qinjian@cqplus1.com>
Date: Tue, 14 Jun 2022 12:26:20 -0700
User-Agent: alot/0.10
Message-Id: <20220614192622.B401BC3411B@smtp.kernel.org>

Quoting Qin Jian (2022-06-14 01:31:03)
> Add documentation to describe Sunplus SP7021 clock driver bindings.
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Qin Jian <qinjian@cqplus1.com>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
