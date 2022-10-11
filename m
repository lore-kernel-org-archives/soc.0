Return-Path: <sboyd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15409C433F5
	for <soc@archiver.kernel.org>; Tue, 11 Oct 2022 03:46:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C52A2C433D7; Tue, 11 Oct 2022 03:46:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D467C433C1;
	Tue, 11 Oct 2022 03:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665459991;
	bh=yfK1FBZqycCQDDu/oT/9bPM1Frdq6xs8PDOMhDLeNbY=;
	h=In-Reply-To:References:Subject:From:List-Id:Cc:To:Date:From;
	b=PHdXlAhFY2WitvjwAoehrGX9D25a1Z7fphlLC/oMQyYsM4lBO+buUS60eD/A7jf1B
	 a3slisODVo9HH+0/HJuhEDm8QM8ChMKTUJ4TwZ0oRTgxwqHKby5CB6xsXIriryRC6s
	 yrpXqSGnphwP69l8aoydQwIv08OOm524hIJRk1ufY8s2l18aRpNbVajixkJghbC2no
	 9m0Ja7DqeMkOCjiFw1BPt5hMnrx9wo6cTd3hlftB2UFHxDsnNhJ0DJQCypfs15HMiU
	 PGUEIYW1ah4/LgAxvAl6AiOlsrWjqIJ8Y5EOTCl2Ggdt+3weXGMVEX4tImdf82afef
	 MAMc4VmWtXirw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221011031104.5gvw47ocbhj52oxy@vireshk-i7>
References: <f334e8bcc22fde795de9c8067898d4c0522d44ae.1665375739.git.viresh.kumar@linaro.org> <20221011010116.A6245C433C1@smtp.kernel.org> <20221011031104.5gvw47ocbhj52oxy@vireshk-i7>
Subject: Re: [PATCH] clk: spear: Move prototype to accessible header
From: Stephen Boyd <sboyd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Russell King <linux@armlinux.org.uk>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, Viresh Kumar <vireshk@kernel.org>, soc@kernel.org, kernel test robot <lkp@intel.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Date: Mon, 10 Oct 2022 20:46:29 -0700
User-Agent: alot/0.10
Message-Id: <20221011034631.9D467C433C1@smtp.kernel.org>

Quoting Viresh Kumar (2022-10-10 20:11:04)
> On 10-10-22, 18:01, Stephen Boyd wrote:
> > __init is meaningless in header files
>=20
> Technically yes.
>=20
> But then I grepped include/ and it is widely used, even by core kernel
> headers. Why is that ? Maybe just to keep prototype consistent ?
>=20
> Also init.h says:
>=20
>  * If the function has a prototype somewhere, you can also add
>  * __init between closing brace of the prototype and semicolon:
>  *
>  * extern int initialize_foobar_device(int, int, int) __init;
>=20
> Hmm, I understand that it is just saying that __init can be used after
> function's name instead of just before, but isn't it also suggesting
> that headers may also have it (maybe just to keep it consistent) ?
>=20

I didn't say it was forbidden ;)
