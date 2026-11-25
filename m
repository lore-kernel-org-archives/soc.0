Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612509;
	b=RJZltfr8GkWUvDk5HIC+QT9bbKRxjpLgKBaPUW0Dm/o4IKcj1B9WOkZHrL+uyAeoPe+/
	 MqnYGdkK7HHkBtaWOXha28vZlQ0gnmJYCWzpiLaSSJkfqgB7l+gO8jbcCgi0IyYf/EDCK
	 M4/nZXn4HmGOXZiqPHCDAVanVquxCxp2oLlKQWs9GMWXtflGZFzTlXSbcTr0wdu0lcsoj
	 ugKQy78LyxNuOG0E4RVyOshnnr95nTk4ceQiTYO7Ucqv+Dl/+Cy28x/oGYVfBYRwU4TCx
	 YJCYkZF1WNda7Lzd6wvPcu62GK/a52a6xG4kD5Al7Sh0PMmvgDIocRXl0EIG83LOjUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612509;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=dNZO0JhNRAbNN5+RLaUFkm1Kxu4E/KzxOOkJ+YEDQi8=;
	b=hMM8v4CRNJVQcahf/QUPN9qCr450QxL1iunE4nm77SmN0CzAgb958xZ0BpxiXr2IaNqv
	 iBxX+sZt0c6NEISo/RLvaRh+ceRua8iyYPV+sb4UTjUTt/2ddrLd5FvgBF/JOyYvM6qWU
	 6RxXdPCwYekWHkMZ3tD5eJbiUiFRYg6NNHoAsQhdFgOZ9zTWu+tRsSNU23zs0IQsk3iFF
	 EtqzktJ0IdTvw6Fcf749rMQlrsK7KjlQLUBhDJzN9q5miPyClSfy5WQSR3YBuzfW7tkjk
	 puyeScDTEuMvoQzzIs1Z52tNAvxjrMkR0zeJWs6TUq2Onn5tWhpXdytXK8rugfzqtfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RBJckhOo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B983606A326
	for <soc@lists.linux.dev>; Wed, 25 Nov 2026 13:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RBJckhOo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D10F1F000CF;
	Wed, 25 Nov 2026 13:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795612508;
	bh=dNZO0JhNRAbNN5+RLaUFkm1Kxu4E/KzxOOkJ+YEDQi8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=RBJckhOoEperCEZUC1A5AnTsvJuqx2elQiGeBLa6sz+rJvprHZ260eVjNi40bIWYa
	 ts9wLmVZo7ygakHmoPXb6NGfShddv8gK71Kh9US8IhW+63MUk58oJFvKjuvIs379H1
	 kqx5pGsT9E1E65dPbXWGCnZ9hfMp0y/baPGKfepj5UcuvhUreTrsVM9OwZQ9V8KfKz
	 L/oyl/ct6nPukLm1ZiYpO/PCiGwc6clBQhXWQpmxoFvEungkpam6PcEl1JsLBoZzuZ
	 BhSsx1V0AEUBWtZvsK831B9sBGV6L5Lkru+QGONaiD2H5H6H9fMtAkZM/2St92ODJz
	 uhhnS3NO5oORQ==
Message-ID: <72ad7820-ec68-4a07-aad6-9b0d8333f702@kernel.org>
Date: Wed, 25 Nov 2026 14:15:05 +0100
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] Ux500 Powerdomain DTS changes for v7.5
To: Linus Walleij <linusw@kernel.org>
Cc: soc@lists.linux.dev, Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <CAD++jLkAjWe12teziGE3-81R0tpO47USD6_pLMMrJ4_DXSOa9g@mail.gmail.com>
 <20261125-smooth-miraculous-eagle-ae81f4@quoll>
 <CAD++jLn4hdGDWhZfdxjLaay4D-Lkf5_1xVh6RfrN3-va2Ab-UQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGPBBMBCgA5AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJp2mE8AAoJEBuTQ307QWKbeaIP
 /ihHTkTW4KsN/DQ945JJbyu5tI0J80Wue7QyyLPglyKfhgb5cLLNPpOC8cCIJsc7+W3i2P38
 s2c1cOH6CYGE7E9ur3Vfme8NW2S2I/Z8VC7bZnzyS23wT17LrsdS/qCpx4o8U+pt/xdXDKph
 EGRYrIEmMpUWvyYzyYKGIe25FtaayIIKpq8eZYyFcp2f/sG5IkOW5uZzHPMPdcm87jU7fyuQ
 rAU2vx9r+ulUfQ/q9Z2roC/ode3l7t2pN7BCBCsUDp6JCrUyZrtT1e7EbA0ZRP3aOBNk2P2E
 DQOgJGjGdO5Yx2Y9LFtltu6JbsBJHi1syGRX3AtQYOMc4Y1WGoeZJmMlvKj2ZqqXNkcWi2DS
 IQEWB0uW6CqFsBBIMGDa+6OzdaVO/uAVXWDWml02Men3CILdI1MbVjoh8ECqYUY7OQ+JJvNN
 vnliuq5WM3Ghd3jg/LZZrxXjdIginRHFQCjIJYLKpLZWm1/iDFedcfzqRNYmTtqscdCNHW41
 oT3Z7BmO9xwdjuwBS6nmS6JJwkbf5Ot2QR4pB/DRU7ZwjT1qHe+9r9gF32wXVQatHNGK/VVu
 sfwOnkdxCWkp/qb2gdQRmZh+SedStWshigH6sNfuHBloF/q+hjMRc8b2m326OZdrbSHwY1Sz
 vti8Hn7n8NjdHO9LKB7BIdjkA9DA5WsqOuVCzsFNBFVDXDQBEADNkrQYSREUL4D3Gws46JEo
 Z9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLueMNsWLJBv
 BaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6eiOMheesVS
 5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wAGldWsRxb
 f3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA6z6lBZn0
 WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9YegxWKvX
 XHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt91pFzBSO
 IpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gUBLHFTg2h
 YnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/JoFzZ4B0
 p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu4vXVFBYI
 GmpyNPYzRm0QPwARAQABwsF2BBgBCgAgAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtBYpsFAmna
 YUkACgkQG5NDfTtBYptX+BAApg32CkxwNucNEi8WfWA8oKkW0y8YDuY6ORMo9FWNGiT/OTy0
 vyJrLocrpn86zwfjVp+eCrssPYh8eqJfnWqmYv6ACQtHPYzPZQ3mSo8H97Z01oUxITzCxpXm
 ZkLgPIqtDPcC2E3dPM/fVxcyowM8XsaMA9wcsaUYrta8toOq2b9tKcjleKMfMrm0gQ9u7wUc
 QbLkwj6TCLOwucb07GXzLTNF9PZmaDUpKAZjMjmrW+le+SFvQbhamx0rxLWPR0NWntXpbCn+
 +ACch03p/JyTBVktxFsFyCt7pTPE1kEaeuXBTe/a2D9iQvRxRW19LvuO2e59/u1wYUiH/orz
 wbIC2S4dBsPAPihL3ztOU1yE86GPyQtSE0kU+/7snnLt4QGi6PChf3t5gnNjAzjUUovO8rgI
 c+5yN5heq5loYHgK6OQ9OlHzsPHO9e9MOQcKlFycs1pyijFGzDwdNUm/SchK8iWT2QApTx4A
 K9bCVaboTA2T77QYkRcRJYSsO1alGX0ome/hMLD1daXlkrNUp1HWa3K4iytLRXjCSIorWiGs
 n+q3krnpXu3TFkA8qtOFZMdnIiFuiq1yLT8hptsV5xh1TA2nsVvSYiaCr3q4s4BKjS/KrLDb
 qoxzw8ISjdUp4pA85vb6YLCmb39NgidD+7PmAr65lBNveIFynTgsja1rRQ4=
In-Reply-To: <CAD++jLn4hdGDWhZfdxjLaay4D-Lkf5_1xVh6RfrN3-va2Ab-UQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/11/2026 13:59, Linus Walleij wrote:
> On Wed, Nov 25, 2026 at 1:21 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> 
>>>   git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
>>> tags/ux500-pd-v7.5
>>
>> I think I commented last time. Please, please fix your mailer. You keep
>> stopping me from simple line selection and pasting.
> 
> Oh yeah I remember, sorry. I don't know how to fix it, it's the gmail editor...
> I.e. I generate the PR with git request pull > reqpull.txt
> then bring that up in a text editor and select all and paste into
> gmail,
> 
> It would be great if git send-pull-request existed and would bring
> up an editor if choice then send the pull request the same way
> as git send-email... ChatGPT suggests making a bash script
> based on it send-email --annotate, maybe I should try that!
> 

I git send-email my pulls. You can trim most of below to get it:
https://github.com/krzk/tools/blob/master/linux/krzk-request-pull.sh

Best regards,
Krzysztof
